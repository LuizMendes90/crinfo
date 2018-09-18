urlApp = 'App.php'

interact_fields = {};
interact_fields_composicao = {};

interact_fields['id'] = '';
interact_fields['nome'] = '';
interact_fields['custo'] = '';
interact_fields['descricao'] = '';
interact_fields['status'] = '';
interact_fields['id_raridade'] = '';

interact_fields_composicao['id_carta'] = '';
interact_fields_composicao['id_personagem'] = '';
interact_fields_composicao['id_personagem_composicao'] = '';
interact_fields_composicao['quantidade_personagem'] = '';

function grid() {
    $('#table_principal').DataTable().destroy();

    $.ajax({
        url: urlApp,
        type: 'POST',
        dataType: 'JSON',
        data: {

            action: 'Carta',
            method: 'getAll'

        }, success: function (data) {

            tbody = '';

            if (data.count) {

                tbody = '';

                $.each(data.result, function (key, value) {

                    tbody += '<tr>' +
                        '<td width="60%">' + value.nome + '</td>' +
                        '<td width="10%">' + value.custo + '</td>' +
                        '<td width="10%">' + value.descricao + '</td>' +
                        '<td width="10%">' + value.raridade + '</td>' +
                        '<td width="10%">' + value.status + '</td>' +
                        '<td width="10%" class="composicao" data-id="' + value.id + '"></td>' +
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


function loadPersonagem() {
    var formData = new FormData();

    formData = load_fields(formData, interact_fields);

    formData.append('action', "Personagem");

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
                    option += '<option value="' + value.id + '" >' + value.nome + '</option>';
                });

                $("#id_personagem").html(option);

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


function loadRaridade() {
    var formData = new FormData();

    formData = load_fields(formData, interact_fields);

    formData.append('action', "Raridade");

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
                    option += '<option value="' + value.id + '" >' + value.nome + '</option>';
                });

                $("#id_raridade").html(option);

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


function grid_composicao() {

    $('#table_composicao').DataTable().destroy();

    $.ajax({
        url: urlApp,
        type: 'POST',
        dataType: 'JSON',
        data: {

            action: 'CartaComposicao',
            method: 'getAllJoin',
            id_carta: $("#id_carta").val()

        }, success: function (data) {

            tbody = '';

            if (data.count) {

                tbody = "";

                $.each(data.result, function (key, value) {

                    tbody += '<tr>' +
                        '<td width="60%">' + value.personagem + '</td>' +
                        '<td width="10%">' + value.quantidade_personagem + '</td>' +
                        '<td width="10%" class="delete_composicao_carta" data-idpersonagem="' + value.id_personagem + '" data-idcarta="' + value.id_carta + '"></td>' +
                        '</tr>';
                });

                
            } else if (data.MSN) {
                mensagem('Erro', data.msnErro, '', '');
            }

            $('.grid_composicao').html(tbody);
        }
    }).done(function () {
        $('#table_composicao').DataTable();
    });

}


function create(formData) {

    formData.append('action', "Carta");

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


function create_composicao(formData) {

    formData.append('action', "CartaComposicao");
    formData.append('method', "create");

    $.ajax({
        url: urlApp,
        type: 'POST',
        dataType: 'JSON',
        data: formData,
        success: function (data) {
            if (data.result) {
                mensagem('OK', 'Cadastrado', 'success', '');
                clear_field('#form-composicao');
                grid_composicao();
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

function remove(formData) {

    formData.append('action', "Carta");

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


function removeComposicao(formData) {

    formData.append('action', "CartaComposicao");

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
        
        grid_composicao();
    });
}

function update(formData) {

    formData.append('action', "Carta");

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

    formData.append('action', "Carta");

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
        $(".select2_single").select2({
            placeholder: "Selecione",
            allowClear: true
        });
    });

}

$("#form-principal").submit(function (e) {

    e.preventDefault();

    var formData = new FormData();

    formData = load_fields(formData, interact_fields);

    formData.get('id') ? update(formData) : create(formData);

});

$(document).ready(function () {
    loadRaridade();
    grid();

    $(document).on("click",".composicao",function(){
        loadPersonagem();
        dataId = $(this).data("id");
        $("#id_carta").val(dataId);
        grid_composicao();
        $(".modal_composicao").modal('show');
    })


    $(document).on('click', '.add', function () {
        $(".modal_principal").modal('show');
    })

    $(document).on('click', '.add_composicao', function () {


        var formData = new FormData();

        formData = load_fields(formData, interact_fields_composicao);

        create_composicao(formData);
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

    $(document).on('click', '.delete_composicao_carta', function () {

        id_carta = $(this).data('idcarta');
        id_personagem = $(this).data('idpersonagem');

        if (confirm("Remover o registro?")) {
            $("#id_carta").val(id_carta);
            $("#id_personagem_composicao").val(id_personagem);

            var formData = new FormData();

            formData = load_fields(formData, interact_fields_composicao);

            removeComposicao(formData);
        }
    });
    

    $(document).on('click', '.update', function () {

        dataId = $(this).data('id');

        $("#id").val(dataId);

        load();
    })

})
