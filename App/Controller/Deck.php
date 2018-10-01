<?php

namespace App\Controller;

require_once CORE . DS . 'Controller.php';
require_once MODEL . DS . 'Carta.php';

use App\Core\Controller;
use App\Core\Model;
use App\Model\Carta as Carta_Model;

class Deck extends Controller
{

    private $oModel;
    private $oView;
    private $server;

    public function __construct()
    {
        parent::__construct();
        $this->server = "http://localhost/crinfodeck/App/Core/App.php";

    }

    public function render()
    {
        $this->oView->render();
    }

    public function create($object)
    {
     
        $object['action'] = "Deck";
        $object['method'] = "create";

        $object = json_encode($object);
 
        

        $curl = curl_init($this->server);

        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

        curl_setopt($curl, CURLOPT_POSTFIELDS, $object);

        $result = curl_exec($curl);

        echo $result;
        
    }

    public function update($object)
    {

        $object['action'] = "Deck";
        $object['method'] = "update";

        $object = json_encode($object);
 
        

        $curl = curl_init($this->server);

        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

        curl_setopt($curl, CURLOPT_POSTFIELDS, $object);

        $result = curl_exec($curl);

        echo $result;
    }


    public function updateCarta($object)
    {

        $object['action'] = "Deck";
        $object['method'] = "updateCarta";

        $object = json_encode($object);
 
        

        $curl = curl_init($this->server);

        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

        curl_setopt($curl, CURLOPT_POSTFIELDS, $object);

        $result = curl_exec($curl);

        echo $result;
    }

    public function delete($object)
    {
        $object['action'] = "Deck";
        $object['method'] = "delete";

        $object = json_encode($object);
 
        

        $curl = curl_init($this->server);

        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

        curl_setopt($curl, CURLOPT_POSTFIELDS, $object);

        $result = curl_exec($curl);

        echo $result;
    }

    public function getAll()
    {




        $object['action'] = "Deck";
        $object['method'] = "getAll";
 
        

        $curl = curl_init($this->server);

        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

        curl_setopt($curl, CURLOPT_POSTFIELDS, $object);

        $result = curl_exec($curl);

        echo $result;
    }

    public function getAllJoin()
    {

        $arrayRetorno = array();

        $oMCarta = new Carta_Model();

        $resultCartas = $oMCarta->getAll();

        $object = array();
        $object['action'] = "Deck";
        $object['method'] = "getAllJoin";
        
        $arrayCartas = array();
        $resultCartas = $resultCartas['result'];

        foreach($resultCartas as $value){
            $id = $value['id'];
            $nome = $value['nome'];
            $arrayCartas[$id] = $nome;
        }
        
        $object = json_encode($object);

        

        $curl = curl_init($this->server);

        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

        curl_setopt($curl, CURLOPT_POSTFIELDS, $object);

         $result = curl_exec($curl);

        $retorno = json_decode($result);

        $retorno = $retorno->result;

        $arrayTemp = array();
        $i = 0;
        foreach($retorno as $ret){
            
                $arrayTemp[$i]['id'] = $ret->id;
                $arrayTemp[$i]['deck'] = $ret->deck;
                $arrayTemp[$i]['status'] = $ret->status;
                if ($ret->carta_1){
                   $arrayTemp[$i]['carta_1'] = $arrayCartas[$ret->carta_1];
                }
                if ($ret->carta_2){
                    $arrayTemp[$i]['carta_2'] = $arrayCartas[$ret->carta_2];
                 }
                 if ($ret->carta_3){
                    $arrayTemp[$i]['carta_3'] = $arrayCartas[$ret->carta_3];
                 }
                 if ($ret->carta_4){
                    $arrayTemp[$i]['carta_4'] = $arrayCartas[$ret->carta_4];
                 }
                 if ($ret->carta_5){
                    $arrayTemp[$i]['carta_5'] = $arrayCartas[$ret->carta_5];
                 }
                 if ($ret->carta_6){
                    $arrayTemp[$i]['carta_6'] = $arrayCartas[$ret->carta_6];
                 }
                 if ($ret->carta_7){
                    $arrayTemp[$i]['carta_7'] = $arrayCartas[$ret->carta_7];
                 }
                 if ($ret->carta_8){
                    $arrayTemp[$i]['carta_8'] = $arrayCartas[$ret->carta_8];
                 }
         
            
            $i++;
        }
        $array['result'] = $arrayTemp;
        $array['status'] = true;
        $array['MSN'] = '';
        $array['count'] = $i;
        // print_r($retorno);
        echo json_encode($array);
    }

    public function getById($object)
    {

        $object['action'] = "Deck";
        $object['method'] = "getById";

        $object = json_encode($object);
 
        

        $curl = curl_init($this->server);

        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

        curl_setopt($curl, CURLOPT_POSTFIELDS, $object);

        $result = curl_exec($curl);

        echo $result;
    }



}