urlApp = 'App.php'

interact_fields = {};

interact_fields['id'] = '';
interact_fields['deck'] = '';
interact_fields['carta_1'] = '';
interact_fields['carta_2'] = '';
interact_fields['carta_3'] = '';
interact_fields['carta_4'] = '';
interact_fields['carta_5'] = '';
interact_fields['carta_6'] = '';
interact_fields['carta_7'] = '';
interact_fields['carta_8'] = '';
interact_fields['status'] = '';

function grid() {

    $('#table_principal').DataTable().destroy();

    $.ajax({
        url: urlApp,
        type: 'POST',
        dataType: 'JSON',
        data: {

            action: 'Deck',
            method: 'getAll'

        }, success: function (data) {

            tbody = '';

            if (data.count) {

                tbody = '';

                $.each(data.result, function (key, value) {

                    tbody += '<tr>' +
                        '<td width="60%">' + value.deck + '</td>' +
                        '<td width="10%" class="selecionaCarta">' + value.carta_1 + '</td>' +
                        '<td width="10%" class="selecionaCarta">' + value.carta_2 + '</td>' +
                        '<td width="10%" class="selecionaCarta">' + value.carta_3 + '</td>' +
                        '<td width="10%" class="selecionaCarta">' + value.carta_4 + '</td>' +
                        '<td width="10%" class="selecionaCarta">' + value.carta_5 + '</td>' +
                        '<td width="10%" class="selecionaCarta">' + value.carta_6 + '</td>' +
                        '<td width="10%" class="selecionaCarta">' + value.carta_7 + '</td>' +
                        '<td width="10%" class="selecionaCarta">' + value.carta_8 + '</td>' +
                        '<td width="10%" class="selecionaCarta">' + value.status + '</td>' +
                        '<td width="10%" class="update" data-id="' + value.id + '"></td>' +
                        '<td width="10%" class="delete" data-id="' + value.id + '"></td>' +
                        '</tr>';
                });

                
            } else if (data.MSN) {
                mensagem('Erro', data.msnErro, '', '');
            }
            $('.grid').html(tbody);
        }
    }).done(function () {
        $('#table_principal').DataTable();
    });

}


function loadCarta() {
    var formData = new FormData();

    formData = load_fields(formData, interact_fields);

    formData.append('action', "Carta");

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

                $("#id_carta").html(option);

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

    formData.append('action', "Deck");

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


function remove(formData) {

    formData.append('action', "Deck");

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

    formData.append('action', "Deck");

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

    formData.append('action', "Deck");

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
    grid();

    $(document).on("click",".selecionaCarta",function(){
        loadCarta();
        // dataId = $(this).data("id");
        // $("#id_carta").val(dataId);
        // grid_composicao();
        $(".modal_carta").modal('show');
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
