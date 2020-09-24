<?php


namespace workspace\modules\mailer;


use core\View;

class ViewMailer extends Mailer
{
    public $view;

    private $defaultViewPathBody = WORKSPACE_DIR . '/modules/mailer/views/body/';


    public function __construct(array $config = null)
    {
        parent::__construct($config);
        $this->view = View::get();
    }

    public function send(string $subject, string $key_body, string $email = null, array $data_body = null, array $data_subject = null): bool
    {
        $email === null ? $this->mailer->addAddress($this->admin_email) : $this->mailer->addAddress($email);
        $this->mailer->isHTML(true);
        $this->mailer->Subject = $subject;
        $this->mailer->Body = $data_body === null ? $this->view->getTpl($this->defaultViewPathBody . $key_body) : $this->view->getTpl($this->defaultViewPathBody . $key_body, $data_body);

        return $this->mailer->send();
    }
}