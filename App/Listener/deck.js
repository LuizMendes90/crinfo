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

interact_fields_temp = {};
interact_fields_temp['id_carta'] = '';
interact_fields_temp['campo'] = '';
interact_fields_temp['id_deck'] = '';
interact_fields_temp['id_carta_escolhida'] = '';

function grid() {

    $('#table_principal').DataTable().destroy();

    $.ajax({
        url: urlApp,
        type: 'POST',
        dataType: 'JSON',
        data: {

            action: 'Deck',
            method: 'getAllJoin'

        }, success: function (data) {

            tbody = '';

            if (data.count) {

                tbody = '';

                $.each(data.result, function (key, value) {

                    tbody += '<tr>' +
                        '<td width="10%">' + value.deck + '</td>' +
                        '<td width="10%" class="selecionaCarta" data-id='+value.id+' data-campo="carta_1">' + value.carta_1 + '</td>' +
                        '<td width="10%" class="selecionaCarta" data-id='+value.id+' data-campo="carta_2">' + value.carta_2 + '</td>' +
                        '<td width="10%" class="selecionaCarta" data-id='+value.id+' data-campo="carta_3">' + value.carta_3 + '</td>' +
                        '<td width="10%" class="selecionaCarta" data-id='+value.id+' data-campo="carta_4">' + value.carta_4 + '</td>' +
                        '<td width="10%" class="selecionaCarta" data-id='+value.id+' data-campo="carta_5">' + value.carta_5 + '</td>' +
                        '<td width="10%" class="selecionaCarta" data-id='+value.id+' data-campo="carta_6">' + value.carta_6 + '</td>' +
                        '<td width="10%" class="selecionaCarta" data-id='+value.id+' data-campo="carta_7">' + value.carta_7 + '</td>' +
                        '<td width="10%" class="selecionaCarta" data-id='+value.id+' data-campo="carta_8">' + value.carta_8 + '</td>' +
                        '<td width="10%" class="selecionaCarta" >' + value.status + '</td>' +
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


function loadCarta(formData) {

    var formData = new FormData();

    formData = load_fields(formData, interact_fields_temp);

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

function adicionar_carta(formData) {
    
    formData.append('action', "DeckMem");

    formData.append('method', "adicionarCarta");

    $.ajax({
        url: urlApp,
        type: 'POST',
        dataType: 'JSON',
        data: formData,
        success: function (data) {

            grid_comparacao();
            
        },
        processData: false,
        cache: false,
        contentType: false
    }).done(function () {
        
    });
}


function removerCartas(formData) {

    formData.append('action', "DeckMem");

    formData.append('method', "removerCartas");

    $.ajax({
        url: urlApp,
        type: 'POST',
        dataType: 'JSON',
        data: formData,
        success: function (data) {
            if (data.result) {
                
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
        grid_comparacao()
    });
}

function grid_comparacao() {

    // $('#table_comparacao').DataTable().destroy();

    $.ajax({
        url: urlApp,
        type: 'POST',
        dataType: 'JSON',
        data: {

            action: 'DeckMem',
            method: 'get'

        }, success: function (data) {

            table = '';
            thead_interno = '';
            tbody_interno = '';

            thead = '';
            tbody = '';
            tfooter = '';

            if (1 == 1) {

                $.each(data, function (key, value) {
                
                    thead_interno = "<thead><tr><td class='escolher' data-id_carta_comparacao='"+value[0].id_carta+"'>"+value[0].carta+"</td></tr></thead>";
                   

                    $.each(value, function (key2, value2) {

                        tbody_interno += "<tr><td>"+value2.personagem+"</td></tr>";

                    });
                    table += '<div class="col-md-3 col-sm-3 col-xs-3"><table class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0">'+
                    thead_interno+'<tbody>'+tbody_interno+'</tbody></table></div>';

                    thead_interno = "";
                    tbody_interno = "";
                });

                

                $("#table_comparacao").html(table);
               

                // $("#table_comparacao").html(table)
            } else if (data.MSN) {
                mensagem('Erro', data.msnErro, '', '');
            }
            // $('.grid').html(tbody);
        }
    }).done(function () {
        // $('#table_principal').DataTable();
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


function update_carta(formData) {

    formData.append('action', "Deck");

    formData.append('method', "updateCarta");

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
                grid();
                
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


$(document).on("click",".escolher",function(){

    id_carta = $(this).data("id_carta_comparacao");

    $("#id_carta_escolhida").val(id_carta)

    var formData = new FormData();

    formData = load_fields(formData, interact_fields_temp);

    update_carta(formData)

});

$(document).ready(function () {

    grid();

    $(document).on("click",".selecionaCarta",function(){

        iddeck = $(this).data("id");
        campo = $(this).data("campo");

        $("#id_deck").val(iddeck);
        $("#campo").val(campo);
        

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


    $(document).on('click', '.add_carta', function () {

        var formData = new FormData();

        formData = load_fields(formData, interact_fields_temp);

        adicionar_carta(formData);
    })

    $(document).on('click', '.remover_cartas', function () {

        var formData = new FormData();

        removerCartas(formData);
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
