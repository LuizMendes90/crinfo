<?php

namespace App\Controller;

require_once CORE . DS . 'Controller.php';
require_once VIEW . DS . 'Login.php';
require_once CONTROLLER . DS . 'Usuario.php';

use App\Core\Controller;
use App\View\Login as Login_View;
use App\Controller\Usuario as Usuario_Controller;

class Login extends Controller
{

    public function __construct()
    {
        parent::__construct();
    }

    public function render()
    {

        $oView = new Login_View();
        $oView->render();
    }

    public function login($object)
    {
        
        $oUsuario = new Usuario_Controller();

        $oUsuario->populate($object);

        $result = $oUsuario->getLogin();

        if (isset($result['result']) && $result['count']) {

            $result['result']['senha'] = sha1($result['result']['senha']);
            $_SESSION['crinfo']['login'] = $result['result'];
            unset($result['result']['senha']);
        }

        echo json_encode($result);
    }


}