<?php

namespace App\Model;

require_once CORE . DS . 'Model.php';
require_once DAO . DS . 'Database.php';

use App\Core\Model;
use App\DAO\Database;
use PDO;
use validator\Data_Validator;

class Deck extends Model
{
    private $table = 'decks';

    private $validator;

    public function __construct()
    {
        parent::__construct();

        $this->validator = new Data_Validator();
    }

    public function create()
    {
        
        $this->validator->set('Deck', $this->deck)->is_required();
        $validate = $this->validator->validate();
        $erros = $this->validator->get_errors();

        if (!$validate) {

            $result['result'] = '';
            $result['validar'] = $erros;
            return $result;
        }

         $sql = "INSERT INTO `" . $this->table . "` (deck,status) 
                                                VALUES 
                                                (:deck,:status)";

        $query = $this->dbh->prepare($sql);

        $query->bindValue(':deck', $this->deck, PDO::PARAM_STR);
        $query->bindValue(':status', $this->status, PDO::PARAM_STR);

        

        $result = Database::executa($query);

        return $result;
    }

    public function update()
    {
        
        $this->validator->set('Id', $this->id)->is_required();
        $this->validator->set('deck', $this->deck)->is_required();
        $validate = $this->validator->validate();
        $erros = $this->validator->get_errors();

        if (!$validate) {

            $result['validar'] = $erros;
            return $result;
        }

        $sql = "UPDATE `" . $this->table . "` 
                SET 
                deck = :deck,
                status = :status 
                WHERE id = :id";

        $query = $this->dbh->prepare($sql);

        $query->bindValue(':id', $this->id, PDO::PARAM_STR);
        $query->bindValue(':deck', $this->deck, PDO::PARAM_STR);
        $query->bindValue(':status', $this->status, PDO::PARAM_STR);

        $result = Database::executa($query);

        return $result;
    }


    public function updateCarta()
    {
        
        $this->validator->set('Deck', $this->id_deck)->is_required();
        $this->validator->set('Campo', $this->campo)->is_required();
        $this->validator->set('Carta', $this->id_carta_escolhida)->is_required();
        $validate = $this->validator->validate();
        $erros = $this->validator->get_errors();

        if (!$validate) {

            $result['validar'] = $erros;
            return $result;
        }

        $sql = "UPDATE `" . $this->table . "` 
                SET 
                $this->campo = :id_carta_escolhida
                WHERE id = :id_deck";

        $query = $this->dbh->prepare($sql);

        $query->bindValue(':id_deck', $this->id_deck, PDO::PARAM_STR);
        $query->bindValue(':id_carta_escolhida', $this->id_carta_escolhida, PDO::PARAM_STR);

        $result = Database::executa($query);

        return $result;
    }

    public function getById()
    {
        $this->validator->set('Id', $this->id)->is_required();
        $validate = $this->validator->validate();
        $erros = $this->validator->get_errors();

        if (!$validate) {

            $result['validar'] = $erros;
            return $result;
        }

        $sql = "SELECT T1.* FROM `" . $this->table . "` T1
        WHERE T1.id = :id";

        $query = $this->dbh->prepare($sql);

        $query->bindValue(':id', $this->id, PDO::PARAM_STR);


        $result = Database::executa($query);

        if ($result['status'] && $result['count']) {

            for ($i = 0; $linha = $query->fetch(PDO::FETCH_ASSOC); $i++) {
                $array['id'] = $linha['id'];
                $array['deck'] = $linha['deck'];
                $array['status'] = $linha['status'];
            }

            $result['result'] = $array;
        }
        return $result;
    }

    public function getAll()
    {

        $sql = "SELECT * FROM `" . $this->table."`";

        $query = $this->dbh->prepare($sql);

        $result = Database::executa($query);

        if ($result['status'] && $result['count']) {
            for ($i = 0; $linha = $query->fetch(PDO::FETCH_ASSOC); $i++) {
                $array[$i]['id'] = $linha['id'];
                $array[$i]['deck'] = $linha['deck'];
                $array[$i]['carta_1'] = $linha['carta_1'];
                $array[$i]['carta_2'] = $linha['carta_2'];
                $array[$i]['carta_3'] = $linha['carta_3'];
                $array[$i]['carta_4'] = $linha['carta_4'];
                $array[$i]['carta_5'] = $linha['carta_5'];
                $array[$i]['carta_6'] = $linha['carta_6'];
                $array[$i]['carta_7'] = $linha['carta_7'];
                $array[$i]['carta_8'] = $linha['carta_8'];
                $array[$i]['status'] = $linha['status'];
            }

            $result['result'] = $array;
        }
        return $result;
    }


    public function getAllJoin()
    {

        $sql = "select 	deck.id,deck.deck,deck.status,
		car.nome as carta_1, 
		car2.nome as carta_2,
		car3.nome as carta_3,
        car4.nome as carta_4,
        car5.nome as carta_5,
        car6.nome as carta_6,
        car7.nome as carta_7,
        car8.nome as carta_8
from `" . $this->table."` deck
	left join cartas car
	on carta_1 = car.id
	left join cartas car2
	on carta_2 = car2.id
	left join cartas car3
	on carta_3 = car3.id
	left join cartas car4
	on carta_4 = car4.id
	left join cartas car5
	on carta_5 = car5.id
	left join cartas car6
	on carta_6 = car6.id
	left join cartas car7
	on carta_7 = car7.id
	left join cartas car8
	on carta_8 = car8.id";

        $query = $this->dbh->prepare($sql);

        $result = Database::executa($query);

        if ($result['status'] && $result['count']) {
            for ($i = 0; $linha = $query->fetch(PDO::FETCH_ASSOC); $i++) {
                $array[$i]['id'] = $linha['id'];
                $array[$i]['deck'] = $linha['deck'];
                $array[$i]['carta_1'] = $linha['carta_1'];
                $array[$i]['carta_2'] = $linha['carta_2'];
                $array[$i]['carta_3'] = $linha['carta_3'];
                $array[$i]['carta_4'] = $linha['carta_4'];
                $array[$i]['carta_5'] = $linha['carta_5'];
                $array[$i]['carta_6'] = $linha['carta_6'];
                $array[$i]['carta_7'] = $linha['carta_7'];
                $array[$i]['carta_8'] = $linha['carta_8'];
                $array[$i]['status'] = $linha['status'];
            }

            $result['result'] = $array;
        }
        return $result;
    }

    public function delete()
    {

        $this->validator->set('Id', $this->id)->is_required();
        $validate = $this->validator->validate();
        $erros = $this->validator->get_errors();

        if (!$validate) {

            $result['validar'] = $erros;
            return $result;
        }

        $sql = "DELETE FROM `" . $this->table . "` 
                WHERE id = :id";

        $query = $this->dbh->prepare($sql);

        $query->bindValue(':id', $this->id, PDO::PARAM_STR);

        $result = Database::executa($query);

        return $result;
    }

    function populate($object)
    {
        foreach ($object as $key => $attrib) {
            $this->$key = $attrib;
        }
    }


}