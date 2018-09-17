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
        $this->validator->set('Nivel', $this->id_nivel)->is_required();
        $validate = $this->validator->validate();
        $erros = $this->validator->get_errors();

        if (!$validate) {

            $result['result'] = '';
            $result['validar'] = $erros;
            return $result;
        }

          $sql = "INSERT INTO `" . $this->table . "` (id_personagem,id_habilidade,id_nivel,valor) 
                                                VALUES 
                                                (:id_personagem,:id_habilidade,:id_nivel,:valor)";

        $query = $this->dbh->prepare($sql);

        $query->bindValue(':id_personagem', $this->id_personagem, PDO::PARAM_STR);
        $query->bindValue(':id_habilidade', $this->id_habilidade, PDO::PARAM_STR);
        $query->bindValue(':id_nivel', $this->id_nivel, PDO::PARAM_STR);
        $query->bindValue(':valor', $this->valor, PDO::PARAM_STR);

        

        $result = Database::executa($query);

        return $result;
    }

    public function update()
    {
        
        $this->validator->set('Personagem', $this->id_personagem)->is_required();
        $this->validator->set('Habilidade', $this->id_habilidade)->is_required();
        $this->validator->set('Nivel', $this->id_nivel)->is_required();
        $validate = $this->validator->validate();
        $erros = $this->validator->get_errors();

        if (!$validate) {

            $result['validar'] = $erros;
            return $result;
        }

        $sql = "UPDATE `" . $this->table . "` 
                SET 
                id_personagem = :id_personagem,
                id_habilidade = :id_habilidade,
                id_nivel = :id_nivel,
                valor = :valor
                WHERE T1.id_personagem = :id_personagem and T1.id_habilidade = :id_habilidade and and T1.id_nivel = :id_nivel";

        $query = $this->dbh->prepare($sql);
        
        
        $query->bindValue(':id_personagem', $this->id_personagem, PDO::PARAM_STR);
        $query->bindValue(':id_habilidade', $this->id_habilidade, PDO::PARAM_STR);
        $query->bindValue(':id_nivel', $this->id_nivel, PDO::PARAM_STR);
        $query->bindValue(':valor', $this->valor, PDO::PARAM_STR);

        $result = Database::executa($query);

        return $result;
    }


    public function getById()
    {
        
        $this->validator->set('Personagem', $this->id_personagem)->is_required();
        $this->validator->set('Habilidade', $this->id_habilidade)->is_required();
        $this->validator->set('Nivel', $this->id_nivel)->is_required();

        $validate = $this->validator->validate();
        $erros = $this->validator->get_errors();

        if (!$validate) {

            $result['validar'] = $erros;
            return $result;
        }

        $sql = "SELECT T1.* FROM `" . $this->table . "` T1
        WHERE T1.id_personagem = :id_personagem and T1.id_habilidade = :id_habilidade and T1.id_nivel = :id_nivel";

        $query = $this->dbh->prepare($sql);

       
        $query->bindValue(':id_personagem', $this->id_personagem, PDO::PARAM_STR);
        $query->bindValue(':id_habilidade', $this->id_habilidade, PDO::PARAM_STR);
        $query->bindValue(':id_nivel', $this->id_nivel, PDO::PARAM_STR);
        $query->bindValue(':valor', $this->valor, PDO::PARAM_STR);

        $result = Database::executa($query);

        if ($result['status'] && $result['count']) {

            for ($i = 0; $linha = $query->fetch(PDO::FETCH_ASSOC); $i++) {
                $array['id_personagem'] = $linha['id_personagem'];
                $array['id_habilidade'] = $linha['id_habilidade'];
                $array['id_nivel'] = $linha['id_nivel'];
                $array['valor'] = $linha['valor'];
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
                $array[$i]['id_nivel'] = $linha['id_nivel'];
                $array[$i]['valor'] = $linha['valor'];
            }

            $result['result'] = $array;
        }
        return $result;
    }

    public function getAllJoin()
    {

        $sql = "SELECT hab_per.*,per.nome,hab.habilidade,niv.nivel FROM `" . $this->table."` hab_per
                INNER JOIN personagens per
                ON hab_per.id_personagem = per.id
                INNER JOIN habilidades hab
                ON hab_per.id_habilidade = hab.id
                INNER JOIN niveis niv
                ON hab_per.id_nivel = niv.id";

        $query = $this->dbh->prepare($sql);

        $result = Database::executa($query);

        if ($result['status'] && $result['count']) {
            for ($i = 0; $linha = $query->fetch(PDO::FETCH_ASSOC); $i++) {
                $array[$i]['personagem'] = $linha['nome'];
                $array[$i]['habilidade'] = $linha['habilidade'];
                $array[$i]['nivel'] = $linha['nivel'];
                $array[$i]['id_habilidade'] = $linha['id_habilidade'];
                $array[$i]['id_nivel'] = $linha['id_nivel'];
                $array[$i]['valor'] = $linha['valor'];
            }

            $result['result'] = $array;
        }
        return $result;
    }

    public function delete()
    {
       
        $this->validator->set('Personagem', $this->id_personagem)->is_required();
        $this->validator->set('Habilidade', $this->id_habilidade)->is_required();
        $this->validator->set('Nivel', $this->id_nivel)->is_required();

        $validate = $this->validator->validate();
        $erros = $this->validator->get_errors();

        if (!$validate) {

            $result['validar'] = $erros;
            return $result;
        }

        $sql = "DELETE FROM `" . $this->table . "` 
                WHERE T1.id_personagem = :id_personagem and T1.id_habilidade = :id_habilidade and T1.id_nivel = :id_nivel";

        $query = $this->dbh->prepare($sql);

        
        $query->bindValue(':id_personagem', $this->id_personagem, PDO::PARAM_STR);
        $query->bindValue(':id_habilidade', $this->id_habilidade, PDO::PARAM_INT);
        $query->bindValue(':id_nivel', $this->id_nivel, PDO::PARAM_INT);

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