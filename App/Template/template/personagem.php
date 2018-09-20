<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2> Personagens </h2>
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
                        <th>Código</th>
                        <th>Nome</th>
                        <th>Descrição</th>
                        <th>Status</th>
                        <th>Habilidades</th>
                        <th>Alterar</th>
                        <th>Deletar</th>
                    </tr>
                    </thead>
                    <tbody class='grid'>

                    </tbody>
                    <tfoot>
                    <tr>
                        <th>Código</th>
                        <th>Nome</th>
                        <th>Descrição</th>
                        <th>Status</th>
                        <th>Habilidades</th>
                        <th>Alterar</th>
                        <th>Deletar</th>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal fade modal_principal" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel"> Personagens </h4>
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
                    <input type="hidden" id="id_personagem">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-primary save">Salvar</button>
            </div>
        </div>
    </div>
</div>

<input type="hidden" id="id_personagem_habilidade">
<input type="hidden" id="id_nivel_habilidade">
<input type="hidden" id="id_habilidade_habilidade">

<div class="modal fade modal_habilidades" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel"> Personagem </h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal form-label-left input_mask" id="form-habilidade" method='POST'
                      enctype="multipart/form-data">

                    <div class="col-md-4 col-sm-4 col-xs-4 form-group has-feedback">
                        <label>
                            Personagem                            
                        </label>
                        <select class="select2_single form-control" id="id_habilidade">
                        </select>
                        <span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>

                    </div>
                    
                    <div class="col-md-2 col-sm-2 col-xs-2 form-group has-feedback">
                      
                        <label>
                            Nivel                            
                        </label>
                        <select class="select2_single form-control" id="id_nivel">
                        </select>
                        <span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>

                    </div>

                     <div class="col-md-4 col-sm-4 col-xs-4 form-group has-feedback">
                        <label>
                            Valor
                        </label>
                        <input type="text" class="form-control has-feedback-left" id="valor"
                               placeholder="Valor">
                        <span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>

                    </div>

                     <div class="col-md-2 col-sm-2 col-xs-2 form-group has-feedback">
                        <label>
                                &nbsp;.
                        </label>
                        <a class="add_habilidade">
                            <i class="fa fa-plus">
                            </i>
                        </a>
                    </div>        

                    <div class="row col-md-12 col-sm-12 col-xs-12 form-group has-feedback">           
                        <div class="x_content">
                            <table id="table_habilidade"
                                class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0"
                                width="100%">
                                <thead>
                                <tr>
                                    <th>Nível</th>
                                    <th>Habilidade</th>
                                    <th>Valors</th>
                                    <th>Deletar</th>
                                </tr>
                                </thead>
                                <tbody class='grid_habilidades'>

                                </tbody>
                                <tfoot>
                                <tr>
                                    <th>Nível</th>
                                    <th>Habilidade</th>
                                    <th>Valors</th>
                                    <th>Deletar</th>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
            </div>
        </div>
    </div>
</div>
