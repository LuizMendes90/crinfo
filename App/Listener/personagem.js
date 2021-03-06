urlApp = 'App.php'

interact_fields = {};
interact_fields_habilidade = {};

interact_fields['id'] = '';
interact_fields['nome'] = '';
interact_fields['descricao'] = '';
interact_fields['status'] = '';

interact_fields_habilidade['id_personagem'] = '';
interact_fields_habilidade['id_nivel'] = '';
interact_fields_habilidade['id_habilidade'] = '';
interact_fields_habilidade['id_personagem_habilidade'] = '';
interact_fields_habilidade['id_nivel_habilidade'] = '';
interact_fields_habilidade['id_habilidade_habilidade'] = '';
interact_fields_habilidade['valor'] = '';





function grid() {
    $('#table_principal').DataTable().destroy();

    $.ajax({
        url: urlApp,
        type: 'POST',
        dataType: 'JSON',
        data: {

            action: 'Personagem',
            method: 'getAll'

        }, success: function (data) {

            tbody = '';

            if (data.count) {

                tbody = '';

                $.each(data.result, function (key, value) {

                    tbody += '<tr>' +
                    '<td width="60%">' + value.id + '</td>' +
                        '<td width="60%">' + value.nome + '</td>' +
                        '<td width="10%">' + value.descricao + '</td>' +
                        '<td width="10%">' + value.status + '</td>' +
                        '<td width="10%" class="habilidades" data-id="' + value.id + '"></td>' +
                        '<td width="10%" class="update" data-id="' + value.id + '"></td>' +
                        '<td width="10%" class="delete" data-id="' + value.id + '"></td>' +
                        '</tr>';
                });

                $('.grid').html(tbody);
            } else if (data.MSN) {
                mensagem('Erro', data.msnErro, '', '');
            }
        }
    }).done(function () {
        $('#table_principal').DataTable();
    });

}


function grid_habilidades() {

    $('#table_habilidade').DataTable().destroy();

    $.ajax({
        url: urlApp,
        type: 'POST',
        dataType: 'JSON',
        data: {

            action: 'PersonagemHabilidade',
            method: 'getAllJoin',
            id_personagem: $("#id_personagem").val()

        }, success: function (data) {

            tbody = '';

            if (data.count) {

                tbody = "";

                $.each(data.result, function (key, value) {

                    tbody += '<tr>' +
                        '<td width="10%">' + value.nivel + '</td>' +
                        '<td width="10%">' + value.habilidade + '</td>' +
                        '<td width="10%">' + value.valor + '</td>' +
                        '<td width="10%" class="delete_habilidade_personagem" data-idpersonagem="' + value.id_personagem + '" data-idhabilidade="' + value.id_habilidade + '" data-idnivel="' + value.id_nivel + '"></td>' +
                        '</tr>';
                });

                
            } else if (data.MSN) {
                mensagem('Erro', data.msnErro, '', '');
            }
            $('.grid_habilidades').html(tbody);
        }
    }).done(function () {
        $('#table_habilidade').DataTable();
    });

}

function loadHabilidades() {
    var formData = new FormData();

    formData = load_fields(formData, interact_fields);

    formData.append('action', "Habilidade");

    formData.append('method', "getAll");

    $.ajax({
        url: urlApp,
        type: 'POST',
        dataType: 'JSON',
        data: formData,
        success: function (data) {

            option = '';

            if (data.count) {

                $.each(data.result, function (key, value) {
                    option += '<option value="' + value.id + '" >' + value.habilidade + '</option>';
                });

                $("#id_habilidade").html(option);

            } else if (data.MSN) {
                mensagem('Erro', data.msnErro, '', '');
            }
        },

        processData: false,
        cache: false,
        contentType: false
    }).done(function () {
        $(".select2_single").select2({
            placeholder: "Selecione",
            allowClear: true
        });
    });

}


function loadNiveis() {

    var formData = new FormData();

    formData = load_fields(formData, interact_fields);

    formData.append('action', "Nivel");

    formData.append('method', "getAll");

    $.ajax({
        url: urlApp,
        type: 'POST',
        dataType: 'JSON',
        data: formData,
        success: function (data) {

            option = '';

            if (data.count) {

                $.each(data.result, function (key, value) {
                    option += '<option value="' + value.id + '" >' + value.nivel + '</option>';
                });

                $("#id_nivel").html(option);

            } else if (data.MSN) {
                mensagem('Erro', data.msnErro, '', '');
            }
        },

        processData: false,
        cache: false,
        contentType: false
    }).done(function () {
        $(".select2_single").select2({
            placeholder: "Selecione",
            allowClear: true
        });
    });

}

function create(formData) {

    formData.append('action', "Personagem");

    formData.append('method', "create");

    $.ajax({
        url: urlApp,
        type: 'POST',
        dataType: 'JSON',
        data: formData,
        success: function (data) {
            if (data.result) {
                mensagem('OK', 'Cadastrado', 'success', '');
                clear_field('#form-principal');
                grid();
            } else if (data.validar) {
                $.each(data.validar, function (key, value) {
                    mensagem('Atenção', value, 'warning', '');

                })

            } else if (data.MSN) {
                mensagem('Erro', data.msnErro, '', '');
            }
        },
        processData: false,
        cache: false,
        contentType: false
    }).done(function () {

    });
}


function create_habilidade(formData) {

    formData.append('action', "PersonagemHabilidade");

    formData.append('method', "create");

    $.ajax({

        url: urlApp,
        type: 'POST',
        dataType: 'JSON',
        data: formData,
        success: function (data) {
            if (data.result) {
                mensagem('OK', 'Cadastrado', 'success', '');
                clear_field('#form-habilidade');
                grid_habilidades();
            } else if (data.validar) {
                $.each(data.validar, function (key, value) {
                    mensagem('Atenção', value, 'warning', '');

                })

            } else if (data.MSN) {
                mensagem('Erro', data.msnErro, '', '');
            }
        },
        processData: false,
        cache: false,
        contentType: false
    }).done(function () {

    });
}


function removeHabilidade(formData) {

    formData.append('action', "PersonagemHabilidade");

    formData.append('method', "delete");

    $.ajax({
        url: urlApp,
        type: 'POST',
        dataType: 'JSON',
        data: formData,
        success: function (data) {
            if (data.validar) {
                $.each(data.validar, function (key, value) {
                    mensagem('Atenção', value, 'warning', '');

                })

            } else if (data.result) {

                mensagem('OK', 'Removido', 'success', '');

            } else if (data.MSN) {

                mensagem('Erro', data.msnErro, '', '');

            }
        },
        processData: false,
        cache: false,
        contentType: false
    }).done(function () {
        
        grid_habilidades();
    });
}

function remove(formData) {

    formData.append('action', "Personagem");

    formData.append('method', "delete");

    $.ajax({
        url: urlApp,
        type: 'POST',
        dataType: 'JSON',
        data: formData,
        success: function (data) {
            if (data.validar) {
                $.each(data.validar, function (key, value) {
                    mensagem('Atenção', value, 'warning', '');

                })

            } else if (data.result) {

                mensagem('OK', 'Removido', 'success', '');

            } else if (data.MSN) {

                mensagem('Erro', data.msnErro, '', '');

            }
        },
        processData: false,
        cache: false,
        contentType: false
    }).done(function () {
        clear_field('#form-principal');
        grid();
    });
}

function update(formData) {

    formData.append('action', "Personagem");

    formData.append('method', "update");

    $.ajax({
        url: urlApp,
        type: 'POST',
        dataType: 'JSON',
        data: formData,
        success: function (data) {
            if (data.validar) {
                $.each(data.validar, function (key, value) {
                    mensagem('Atenção', value, 'warning', '');

                })
            } else if (data.result) {
                mensagem('OK', 'Alterado', 'success', '');
                clear_field('#form-principal');
                grid();
                load();
            } else if (data.MSN) {
                mensagem('Erro', data.msnErro, '', '');
            }


        },
        processData: false,
        cache: false,
        contentType: false
    }).done(function () {

    });
}


function load() {

    var formData = new FormData();

    formData = load_fields(formData, interact_fields);

    formData.append('action', "Personagem");

    formData.append('method', "getById");

    $.ajax({
        url: urlApp,
        type: 'POST',
        dataType: 'JSON',
        data: formData,
        success: function (data) {

            if (data.result) {

                fill_fields(data);

            }
            else if (data.MSN) {
                mensagem('Erro', data.msnErro, '', '');
            }
        },
        processData: false,
        cache: false,
        contentType: false
    }).done(function () {
        $(".modal_principal").modal('show');
    });

}

$("#form-principal").submit(function (e) {

    e.preventDefault();

    var formData = new FormData();

    formData = load_fields(formData, interact_fields);

    formData.get('id') ? update(formData) : create(formData);

});

$(document).on("click",".habilidades",function(){

    loadHabilidades();
    loadNiveis();
    
    dataId = $(this).data('id');

    $("#id_personagem").val(dataId);

    grid_habilidades();

    $(".modal_habilidades").modal('show');

})

$(document).ready(function () {

    grid();

    $(document).on('click', '.add', function () {
        $(".modal_principal").modal('show');
    })

    $(document).on('click', '.add_habilidade', function () {


        var formData = new FormData();

        formData = load_fields(formData, interact_fields_habilidade);

        create_habilidade(formData);
    })
    $(document).on('click', '.save', function () {

        $("#form-principal").submit();

    })

    $(document).on('click', '.delete', function () {

        dataId = $(this).data('id');
        if (confirm("Remover o registro?")) {
            $("#id").val(dataId);

            var formData = new FormData();

            formData = load_fields(formData, interact_fields);

            remove(formData);
        }
    });


    $(document).on('click', '.delete_habilidade_personagem', function () {

        datapersonagem = $(this).data('idpersonagem');
        datanivel = $(this).data('idnivel');                                  
        datahabilidade = $(this).data('idhabilidade');

        $("#id_personagem_habilidade").val(datapersonagem);
        $("#id_habilidade_habilidade").val(datahabilidade);
        $("#id_nivel_habilidade").val(datanivel);

        if (confirm("Remover o registro?")) {
            $("#id").val(dataId);

            var formData = new FormData();

            formData = load_fields(formData, interact_fields_habilidade);

            removeHabilidade(formData);
        }
    });
    
    $(document).on('click', '.update', function () {

        dataId = $(this).data('id');

        $("#id").val(dataId);

        load();
    })

})
