<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2> Cartas </h2>
                <ul class="nav navbar-right panel_toolbox">
                    <li class="add">
                        <a>
                            <i class="fa fa-plus">

                            </i>
                        </a>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <table id="table_principal"
                       class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0"
                       width="100%">
                    <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Custo</th>
                        <th>Descrição</th>
                        <th>Raridade</th>
                        <th>Status</th>
                        <th>Composição</th>
                        <th>Alterar</th>
                        <th>Deletar</th>
                    </tr>
                    </thead>
                    <tbody class='grid'>

                    </tbody>
                    <tfoot>
                    <tr>
                        <th>Nome</th>
                        <th>Custo</th>
                        <th>Descrição</th>
                        <th>Raridade</th>
                        <th>Status</th>
                        <th>Composição</th>
                        <th>Alterar</th>
                        <th>Deletar</th>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="modal fade modal_principal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel"> Cartas </h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal form-label-left input_mask" id="form-principal" method='POST'
                      enctype="multipart/form-data">

                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                        <label>
                            Nome
                        </label>
                        <input type="text" class="form-control has-feedback-left" id="nome"
                               placeholder="Nome">
                        <span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>
                    </div>

                     <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                        <label>
                            Raridade
                        </label>
                        <select class="select2_single form-control" id="id_raridade">
                        </select>

                    </div>

                     <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                        <label>
                            Custo
                        </label>
                        <input type="text" class="form-control has-feedback-left" id="custo"
                               placeholder="Custo">
                        <span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>

                    </div>

                     <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                        <label>
                            Descrição
                        </label>
                        <input type="text" class="form-control has-feedback-left" id="descricao"
                               placeholder="Descrição">
                        <span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>

                    </div>

                    <div class="checkbox col-md-6 col-sm-6 col-xs-12 form-group has-feedback">

                        <label>
                            <input type="checkbox" class="flat" id="status" checked="checked"> Ativado
                        </label>
                    </div>

                    <input type="hidden" id="id">
                    <input type="hidden" id="id_carta">
                    <input type="hidden" id="id_personagem_composicao">
                    
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-primary save">Salvar</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade modal_composicao" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel"> Composição </h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal form-label-left input_mask" id="form-composicao" method='POST'
                      enctype="multipart/form-data">

                    <div class="col-md-4 col-sm-4 col-xs-4 form-group has-feedback">
                        <label>
                            Personagem                            
                        </label>
                        <select class="select2_single form-control" id="id_personagem">
                        </select>
                        <span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>
                    </div>

                    <div class="col-md-4 col-sm-4 col-xs-4 form-group has-feedback">
                        <label>
                            Quantidade Personagem                            
                        </label>
                        <input  class="form-control" id="quantidade_personagem">
                        
                        <span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>
                    </div>
                    

                     <div class="col-md-2 col-sm-2 col-xs-2 form-group has-feedback">
                        <label>
                                &nbsp;.
                        </label>
                        <a class="add_composicao">
                            <i class="fa fa-plus">
                            </i>
                        </a>
                    </div>        

                    <div class="row col-md-12 col-sm-12 col-xs-12 form-group has-feedback">           
                        <div class="x_content">
                            <table id="table_composicao"
                                class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0"
                                width="100%">
                                <thead>
                                <tr>
                                    <th>Personagem</th>
                                    <th>Quantidade Personagem</th>
                                    <th>Deletar</th>
                                </tr>
                                </thead>
                                <tbody class='grid_composicao'>

                                </tbody>
                                <tfoot>
                                <tr>
                                    <th>Personagem</th>
                                    <th>Quantidade Personagem</th>
                                    <th>Deletar</th>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <input type="hidden" id="id_personagem">
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
            </div>
        </div>
    </div>
</div>