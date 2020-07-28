<?php


namespace core;


use Exception;
use Illuminate\Filesystem\Filesystem;
use Phroute\Phroute\Dispatcher;
use Phroute\Phroute\Exception\HttpMethodNotAllowedException;
use Phroute\Phroute\Exception\HttpRouteNotFoundException;
use routing\Filter;

/**
 * Class App
 * @package core
 * @property Header $header
 */
class App
{
    /**
     * @var array
     */
    static $activeMods;
    /**
     * @var array
     */
    static $migrationsPaths = [];
    /**
     * @var array
     */
    static $config = [];
    /**
     * @var $collector CgRouteCollector
     */
    static $collector;
    /**
     * @var array
     */
    static $configList;
    /**
     * @var string
     */
    static $responseType = ResponseType::TEXT_HTML;
    /**
     * @var $header Header
     */
    static $header;
    /**
     * @var $db Database
     */
    static $db;
    /**
     * @var $breadcrumbs BCContainer
     */
    static $breadcrumbs;
    public $routList;

    public static function mergeConfig($config)
    {
        App::$config = array_merge_recursive(App::$config, $config);
    }

    public static function start()
    {
        return new self();
    }

    public function setConfig($configListFile = 'list.php')
    {
        $this->activeMod();
        App::$configList = (include(CONFIG_DIR . '/' . $configListFile));
        foreach (App::$configList as $item) {
            App::$config = array_merge(App::$config, (include(CONFIG_DIR . '/' . $item)));
        }
        App::$header = new Header();
        App::$collector = new CgRouteCollector();
        App::$breadcrumbs = new BCContainer();

        return $this;
    }

    public function activeMod()
    {
        $mods = self::getMods();
        foreach ((array)$mods as $key => $mod) {
            if ($mod['status'] === 'active') {
                App::$activeMods[$key] = $mod;
            }
        }
    }

    public static function getMods()
    {
        $filesystem = new Filesystem();
        if (!$filesystem->exists(ROOT_DIR . "/mods.json")) {
            return null;
        }

        return json_decode(file_get_contents(ROOT_DIR . "/mods.json"), true);
    }

    public function setRouting($routListFile = 'list.php')
    {
        $this->routList = (include(CORE_DIR . '/routing/rout.php'));
        $this->routList = (include(ROUTING_DIR . '/' . $routListFile));
        foreach ($this->routList as $item) {
            include(ROUTING_DIR . '/' . $item);
        }
        return $this;
    }

    public function run()
    {
        $this->setMods();
        App::$db = new Database();
        $dispatcher = new Dispatcher(App::$collector->getData());
        /* Catch error pages */
        try {
            $response = $dispatcher->dispatch($_SERVER['REQUEST_METHOD'], parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));
        } catch (HttpMethodNotAllowedException $ex) {
           // $this->setError(403);
        } catch (HttpRouteNotFoundException $ex) {
            $this->setError(404);
        } /*catch (Exception $ex) {
            $this->setError(500);
        }*/
        header('Content-Type: ' . App::$responseType);
        App::$header->set();
        echo $response;
    }

    protected function setMods()
    {
        $filesystem = new Filesystem();
        if (App::$activeMods)
            foreach (App::$activeMods as $key => $mod) {
                $modulePath = WORKSPACE_DIR . "/modules/" . $key;
                if ($filesystem->exists($modulePath . "/manifest.json")) {
                    $manifest = json_decode(file_get_contents($modulePath . "/manifest.json"), true);
                    if (isset($manifest['configFile'])) {
                        App::$config = array_merge(App::$config, (include($modulePath . '/' . $manifest['configFile'])));
                    }
                    if (isset($manifest['routFile'])) {
                        include($modulePath . '/' . $manifest['routFile']);
                    }
                    if (isset($manifest['migrationPath'])) {
                        App::$migrationsPaths[] = WORKSPACE_DIR . "/modules/" . $key . "/" . $manifest['migrationPath'];
                    }
                    if (isset($manifest['class'])) {
                        call_user_func_array([$manifest['class'], 'run'], []);
                    }
                }
            }
    }

    private function setError($error)
    {
        http_response_code($error);
        $path = App::$config['error_page_path'] . $error . '.php';//' workspace/views/errors/' . $error . '.php';
        if (file_exists($path)) {
            require $path;
        } else {
            echo 'Error ' . $error;
        }
        die();
    }

    protected function setModRouting()
    {
        $filesystem = new Filesystem();
        foreach (App::$activeMods as $key => $mod) {
            $modulePath = WORKSPACE_DIR . "/modules/" . $key;
            if ($filesystem->exists($modulePath . "/manifest.json")) {
                $manifest = json_decode(file_get_contents($modulePath . "/manifest.json"), true);
                if (isset($manifest['routFile'])) {
                    include($modulePath . '/' . $manifest['routFile']);
                }
            }
        }
    }
}