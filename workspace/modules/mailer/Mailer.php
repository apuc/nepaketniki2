<?php


namespace workspace\modules\mailer;


use PHPMailer\PHPMailer\PHPMailer;


/**
 * Class Mailer
 * @package workspace\modules\mailer
 */
class Mailer
{
    protected $mailer;
    protected $admin_email;


    /**
     * Mailer constructor.
     * @param array|null $config
     * @throws \PHPMailer\PHPMailer\Exception
     */
    public function __construct(array $config = null)
    {
        if ($config === null) {
            $config = require WORKSPACE_DIR . '/modules/mailer/config/mailer.php';
            $this->initMailer($config['SMTP_CHARSET'], $config['SMTP_HOST'], $config['SMTP_USERNAME'], $config['SMTP_PASSWORD'],
                $config['SMTP_SECURE'], $config['SMTP_PORT'], $config['SMTP_EMAIL_FROM'], $config['ADMIN_EMAIL']);
        } else {
            $this->initMailer($config['SMTP_CHARSET'], $config['SMTP_HOST'], $config['SMTP_USERNAME'], $config['SMTP_PASSWORD'],
                $config['SMTP_SECURE'], $config['SMTP_PORT'], $config['SMTP_EMAIL_FROM'], $config['ADMIN_EMAIL']);
        }
    }

    /**
     * @param string $charset
     * @param string $host
     * @param string $username
     * @param string $password
     * @param string $secure
     * @param string $port
     * @param string $email_from
     * @throws \PHPMailer\PHPMailer\Exception
     */
    private function initMailer(string $charset, string $host, string $username, string $password, string $secure, string $port, string $email_from, string $admin_email)
    {
        $this->mailer = new PHPMailer();
        $this->mailer->isSMTP();
        $this->mailer->CharSet = $charset;
        $this->mailer->Host = $host;
        $this->mailer->SMTPAuth = true;
        $this->mailer->Username = $username;
        $this->mailer->Password = $password;
        $this->mailer->SMTPSecure = $secure;
        $this->mailer->Port = $port;
        $this->admin_email = $admin_email;
        $this->mailer->setFrom($email_from);
    }

    /**
     * @param string $email
     * @param string $subject
     * @param string $body
     * @return bool
     * @throws \PHPMailer\PHPMailer\Exception
     */
    public function send(string $subject, string $body, string $email = null): bool
    {
        $email === null ? $this->mailer->addAddress($this->admin_email) : $this->mailer->addAddress($email);
        $this->mailer->isHTML(true);
        $this->mailer->Subject = $subject;
        $this->mailer->Body = $this->getMailerBody('reservation');

        return $this->mailer->send();
    }
}
