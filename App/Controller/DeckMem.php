<?php

namespace App\Controller;

require_once CORE . DS . 'Controller.php';
require_once MODEL . DS . 'DeckMem.php';
require_once MODEL . DS . 'CartaComposicao.php';
require_once VIEW . DS . 'DeckMem.php';
require_once VIEW . DS . 'CartaComposicao.php';

use App\Core\Controller;
use App\Core\Model;
use App\Model\DeckMem as DeckMem_Model;
use App\View\DeckMem as DeckMem_View;
use App\Model\CartaComposicao as CartaComposicao_Model;
use App\View\CartaComposicao as CartaComposicao_View;

class DeckMem extends Controller
{

    private $oModel;
    private $oView;
    private $oModelComposicao;
    private $oViewComposicao;

    public function __construct()
    {
        parent::__construct();

        

        $this->oModel = new DeckMem_Model();
        $this->oView = new DeckMem_View();
        $this->oModelComposicao = new CartaComposicao_Model();
        $this->oViewComposicao = new CartaComposicao_View();
    }

    public function render()
    {
        $this->oView->render();
    }

    public function create($object)
    {
        $this->oModel->transection();

        $this->oModel->populate($object);

        $result = $this->oModel->create();

        $this->oModel->commit();

        echo json_encode($result);
    }

    public function adicionarCarta($object){

        $this->oModelComposicao->populate($object);

        $result = $this->oModelComposicao->getAllJoin();
        
        $id = $object['id_carta'];

        $_SESSION['crinfo']['cartas'][$id] = $result['result'];

        $array = array("status"=>"ok");

        echo json_encode($array);
    }


    public function removerCartas(){

        $_SESSION['crinfo']['cartas'] = array();

        
        $array = array("status"=>"ok");

        echo json_encode($array);

    }

    public function update($object)
    {

        $this->oModel->transection();

        $this->oModel->populate($object);

        $result = $this->oModel->update();

        $this->oModel->commit();

        echo json_encode($result);
    }

    public function delete($object)
    {
        $this->oModel->transection();

        $this->oModel->populate($object);

        $result = $this->oModel->delete();

        $this->oModel->commit();

        echo json_encode($result);
    }

    public function getAll()
    {
        $result = $this->oModel->getAll();

        echo json_encode($result);
    }


    public function get()
    {
        echo json_encode($_SESSION['crinfo']['cartas']);
    }

    public function getById($object)
    {

        $this->oModel->populate($object);

        $result = $this->oModel->getById();

        echo json_encode($result);
    }

    public function getLogin()
    {
        $result = $this->oModel->getLogin();

        return $result;
    }

    public function getLoginCliente()
    {
        $result = $this->oModel->getLoginCliente();

        return $result;
    }

    public function populate($object)
    {
        $this->oModel->populate($object);
    }


}