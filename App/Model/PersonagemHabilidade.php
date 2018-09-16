<?php

namespace App\Model;

require_once CORE . DS . 'Model.php';
require_once DAO . DS . 'Database.php';

use App\Core\Model;
use App\DAO\Database;
use PDO;
use validator\Data_Validator;

class PersonagemHabilidade extends Model
{
    private $table = 'personagem_habilidades';

    private $validator;

    public function __construct()
    {
        parent::__construct();

        $this->validator = new Data_Validator();
    }

    public function create()
    {
        
        $this->validator->set('Personagem', $this->id_personagem)->is_required();
        $this->validator->set('Habilidade', $this->id_habilidade)->is_required();
        $validate = $this->validator->validate();
        $erros = $this->validator->get_errors();

        if (!$validate) {

            $result['result'] = '';
            $result['validar'] = $erros;
            return $result;
        }

          $sql = "INSERT INTO `" . $this->table . "` (id_personagem,id_habilidade) 
                                                VALUES 
                                                (:id_personagem,:id_habilidade)";

        $query = $this->dbh->prepare($sql);

        $query->bindValue(':id_personagem', $this->id_personagem, PDO::PARAM_STR);
        $query->bindValue(':id_habilidade', $this->id_habilidade, PDO::PARAM_STR);

        

        $result = Database::executa($query);

        return $result;
    }

    public function update()
    {
        
        $this->validator->set('Personagem', $this->id_personagem)->is_required();
        $this->validator->set('Habilidade', $this->id_habilidade)->is_required();
        $validate = $this->validator->validate();
        $erros = $this->validator->get_errors();

        if (!$validate) {

            $result['validar'] = $erros;
            return $result;
        }

        $sql = "UPDATE `" . $this->table . "` 
                SET 
                id_personagem = :id_personagem,
                id_habilidade = :id_habilidade
                WHERE T1.id_personagem = :id_personagem and T1.id_habilidade = :id_habilidade";

        $query = $this->dbh->prepare($sql);
        
        
        $query->bindValue(':id_personagem', $this->id_personagem, PDO::PARAM_STR);
        $query->bindValue(':id_habilidade', $this->id_habilidade, PDO::PARAM_INT);

        $result = Database::executa($query);

        return $result;
    }


    public function getById()
    {
        $this->validator->set('Personagem', $this->id_personagem)->is_required();
        $this->validator->set('Habilidade', $this->id_habilidade)->is_required();
        $validate = $this->validator->validate();
        $erros = $this->validator->get_errors();

        if (!$validate) {

            $result['validar'] = $erros;
            return $result;
        }

        $sql = "SELECT T1.* FROM `" . $this->table . "` T1
        WHERE T1.id_personagem = :id_personagem and T1.id_habilidade = :id_habilidade";

        $query = $this->dbh->prepare($sql);

       
        $query->bindValue(':id_personagem', $this->id_personagem, PDO::PARAM_STR);
        $query->bindValue(':id_habilidade', $this->id_habilidade, PDO::PARAM_INT);

        $result = Database::executa($query);

        if ($result['status'] && $result['count']) {

            for ($i = 0; $linha = $query->fetch(PDO::FETCH_ASSOC); $i++) {
                $array['id_personagem'] = $linha['id_personagem'];
                $array['id_habilidade'] = $linha['id_habilidade'];
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
                $array[$i]['id_personagem'] = $linha['id_personagem'];
                $array[$i]['id_habilidade'] = $linha['id_habilidade'];
            }

            $result['result'] = $array;
        }
        return $result;
    }

    public function delete()
    {

        
        $this->validator->set('Personagem', $this->id_personagem)->is_required();
        $this->validator->set('Habilidade', $this->id_habilidade)->is_required();
        $validate = $this->validator->validate();
        $erros = $this->validator->get_errors();

        if (!$validate) {

            $result['validar'] = $erros;
            return $result;
        }

        $sql = "DELETE FROM `" . $this->table . "` 
                WHERE T1.id_personagem = :id_personagem and T1.id_habilidade = :id_habilidade";

        $query = $this->dbh->prepare($sql);

        
        $query->bindValue(':id_personagem', $this->id_personagem, PDO::PARAM_STR);
        $query->bindValue(':id_habilidade', $this->id_habilidade, PDO::PARAM_INT);

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