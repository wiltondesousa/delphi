unit Base;

interface

uses
  SysUtils, Classes, WideStrings, DBXFirebird, DB, SqlExpr, FMTBcd, Provider,
  DBClient, IniFiles, Forms, Dialogs, Controls;

type
  TBancoDados = class(TDataModule)
    Conexao: TSQLConnection;
    qryUsuario: TSQLQuery;
    DSUsuario: TDataSource;
    CDSUsuario: TClientDataSet;
    DSPUsuario: TDataSetProvider;
    qryLog: TSQLQuery;
    qryAlteracao: TSQLQuery;
    qryAlteracaoALTERACAO_ID: TIntegerField;
    qryAlteracaoTABELA: TStringField;
    qryAlteracaoUSUARIO_ID: TIntegerField;
    qryAlteracaoDATA_CADASTRO: TSQLTimeStampField;
    qryAlteracaoDADOS: TMemoField;
    qryAlteracaoRECUPERADA: TSmallintField;
    qryAlteracaoDATA_RECUPERACAO: TSQLTimeStampField;
    qryAlteracaoATIVO: TSmallintField;
    DSAlteracao: TDataSource;
    DSPAlteracao: TDataSetProvider;
    CDSAlteracao: TClientDataSet;
    CDSAlteracaoALTERACAO_ID: TIntegerField;
    CDSAlteracaoTABELA: TStringField;
    CDSAlteracaoUSUARIO_ID: TIntegerField;
    CDSAlteracaoDATA_CADASTRO: TSQLTimeStampField;
    CDSAlteracaoDADOS: TMemoField;
    CDSAlteracaoRECUPERADA: TSmallintField;
    CDSAlteracaoDATA_RECUPERACAO: TSQLTimeStampField;
    CDSAlteracaoATIVO: TSmallintField;
    qryExecute: TSQLQuery;
    qryAlteracaocalc_nome_usuario: TStringField;
    CDSAlteracaocalc_nome_usuario: TStringField;
    qryLogin: TSQLQuery;
    qryLoginUSUARIO_ID: TIntegerField;
    qryLoginLOGIN: TStringField;
    qryLoginSENHA: TStringField;
    qryTabela: TSQLQuery;
    qryTabelaTABELA: TStringField;
    qryTabelaDESCRICAO: TStringField;
    DSTabela: TDataSource;
    DSPTabela: TDataSetProvider;
    CDSTabela: TClientDataSet;
    CDSTabelaTABELA: TStringField;
    CDSTabelaDESCRICAO: TStringField;
    qryAlteracaocalc_descricao_tabela: TStringField;
    CDSAlteracaocalc_descricao_tabela: TStringField;
    qryUsuarioUSUARIO_ID: TIntegerField;
    qryUsuarioATIVO: TSmallintField;
    qryUsuarioDATA_CADASTRO: TSQLTimeStampField;
    qryUsuarioNOME: TStringField;
    qryUsuarioLOGIN: TStringField;
    qryUsuarioSENHA: TStringField;
    qryUsuarioUSUARIO_NIVEL_ID: TIntegerField;
    qryUsuarioDATA_ULTIMA_ALTERA�ÃO: TSQLTimeStampField;
    CDSUsuarioUSUARIO_ID: TIntegerField;
    CDSUsuarioATIVO: TSmallintField;
    CDSUsuarioDATA_CADASTRO: TSQLTimeStampField;
    CDSUsuarioNOME: TStringField;
    CDSUsuarioLOGIN: TStringField;
    CDSUsuarioSENHA: TStringField;
    CDSUsuarioUSUARIO_NIVEL_ID: TIntegerField;
    CDSUsuarioDATA_ULTIMA_ALTERA�ÃO: TSQLTimeStampField;
    qryPessoaEndereco: TSQLQuery;
    DSPessoaEndereco: TDataSource;
    DSPPessoaEndereco: TDataSetProvider;
    CDSPessoaEndereco: TClientDataSet;
    tmpCDSUsuarioAcesso: TClientDataSet;
    qryTmpUsuarioAcesso: TSQLQuery;
    DSPTmpUsuarioAcesso: TDataSetProvider;
    qryTmpUsuarioAcessoUSUARIO_ACESSO_ID: TIntegerField;
    qryTmpUsuarioAcessoUSUARIO_ID: TIntegerField;
    qryTmpUsuarioAcessoTABELA: TStringField;
    qryTmpUsuarioAcessoDESCRICAO: TStringField;
    qryTmpUsuarioAcessoVALOR: TSmallintField;
    tmpCDSUsuarioAcessoUSUARIO_ACESSO_ID: TIntegerField;
    tmpCDSUsuarioAcessoUSUARIO_ID: TIntegerField;
    tmpCDSUsuarioAcessoTABELA: TStringField;
    tmpCDSUsuarioAcessoDESCRICAO: TStringField;
    tmpCDSUsuarioAcessoVALOR: TSmallintField;
    DSUsuarioNivel: TDataSource;
    CDSUsuarioNivel: TClientDataSet;
    DSPUsuarioNivel: TDataSetProvider;
    qryUsuarioNivel: TSQLQuery;
    qryUsuarioNivelUSUARIO_NIVEL_ID: TIntegerField;
    qryUsuarioNivelDESCRICAO: TStringField;
    CDSUsuarioNivelUSUARIO_NIVEL_ID: TIntegerField;
    CDSUsuarioNivelDESCRICAO: TStringField;
    qryTmpUsuarioAcessoTIPO: TStringField;
    tmpCDSUsuarioAcessoTIPO: TStringField;
    qryGeraID: TSQLQuery;
    qryUsuarioExibir: TSQLQuery;
    DSCDSUsuarioExibirColuna: TDataSource;
    CDSUsuarioExibir: TClientDataSet;
    CDSUsuarioExibirColuna: TClientDataSet;
    DSPUsuarioExibir: TDataSetProvider;
    DSPUsuarioExibirColuna: TDataSetProvider;
    qryUsuarioExibirColuna: TSQLQuery;
    CDSUsuarioExibirUSUARIO_EXIBIR_ID: TLargeintField;
    CDSUsuarioExibirUSUARIO_ID: TIntegerField;
    CDSUsuarioExibirFONTE_NOME: TStringField;
    CDSUsuarioExibirFONTE_TAMANHO: TSmallintField;
    CDSUsuarioExibirTABELA: TStringField;
    CDSUsuarioExibirColunaUSUARIO_EXIBIR_COLUNA_ID: TLargeintField;
    CDSUsuarioExibirColunaUSUARIO_EXIBIR_ID: TLargeintField;
    CDSUsuarioExibirColunaINDICE: TSmallintField;
    CDSUsuarioExibirColunaCOLUNA_NOME: TStringField;
    CDSUsuarioExibirColunaCOLUNA_LABEL: TStringField;
    CDSUsuarioExibirColunaVISIVEL: TSmallintField;
    CDSUsuarioExibirColunaTAMANHO: TSmallintField;
    qryTabelaATIVAR_TRACE: TSmallintField;
    CDSTabelaATIVAR_TRACE: TSmallintField;
    qryUsuarioPrivilegio: TSQLQuery;
    CDSUsuarioPrivilegio: TClientDataSet;
    DSPUsuarioPrivilegio: TDataSetProvider;
    qryLoginNIVEL: TStringField;
    qryUsuarioPrivilegioUSUARIO_PRIVILEGIO_ID: TLargeintField;
    qryUsuarioPrivilegioUSUARIO_ID: TIntegerField;
    qryUsuarioPrivilegioPRIVILEGIO_ID: TIntegerField;
    qryUsuarioPrivilegioACESSO: TIntegerField;
    CDSUsuarioPrivilegioUSUARIO_PRIVILEGIO_ID: TLargeintField;
    CDSUsuarioPrivilegioUSUARIO_ID: TIntegerField;
    CDSUsuarioPrivilegioPRIVILEGIO_ID: TIntegerField;
    CDSUsuarioPrivilegioACESSO: TIntegerField;
    CDSPrivilegio: TClientDataSet;
    DSPPrivilegio: TDataSetProvider;
    qryPrivilegio: TSQLQuery;
    qryPrivilegioPRIVILEGIO_ID: TIntegerField;
    qryPrivilegioTABELA: TStringField;
    qryPrivilegioDESCRICAO: TStringField;
    qryPrivilegioABREVIACAO: TStringField;
    CDSPrivilegioPRIVILEGIO_ID: TIntegerField;
    CDSPrivilegioTABELA: TStringField;
    CDSPrivilegioDESCRICAO: TStringField;
    CDSPrivilegioABREVIACAO: TStringField;
    qryAuxiliar: TSQLQuery;
    qryMunicipio: TSQLQuery;
    DSMunicipio: TDataSource;
    CDSMunicipio: TClientDataSet;
    DSPMunicipio: TDataSetProvider;
    CDSMunicipioMUNICIPIO_ID: TIntegerField;
    CDSMunicipioNOME: TStringField;
    CDSMunicipioUF: TStringField;
    CDSMunicipioUF_ID: TIntegerField;
    DSPessoaContato: TDataSource;
    CDSPessoaContato: TClientDataSet;
    DSPPessoaContato: TDataSetProvider;
    qryPessoaContato: TSQLQuery;
    qryPessoa: TSQLQuery;
    DSPPessoa: TDataSetProvider;
    CDSPessoa: TClientDataSet;
    DSPessoa: TDataSource;
    CDSPessoaPESSOA_ID: TIntegerField;
    CDSPessoaATIVO: TSmallintField;
    CDSPessoaDATA_CADASTRO: TSQLTimeStampField;
    CDSPessoaDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSPessoaNOME_APELIDO_FANTASIA: TStringField;
    DSUnidade: TDataSource;
    CDSUnidade: TClientDataSet;
    DSPUnidade: TDataSetProvider;
    qryUnidade: TSQLQuery;
    CDSUnidadeUNIDADE_ID: TIntegerField;
    CDSUnidadeATIVO: TSmallintField;
    CDSUnidadeDATA_CADASTRO: TSQLTimeStampField;
    CDSUnidadeDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSUnidadeDESCRICAO: TStringField;
    qryParametro: TSQLQuery;
    DSParametro: TDataSource;
    CDSParametro: TClientDataSet;
    DSPParametro: TDataSetProvider;
    CDSUsuarioExibirColunaALINHAMENTO: TStringField;
    qryUsuarioExibirUSUARIO_EXIBIR_ID: TLargeintField;
    qryUsuarioExibirUSUARIO_ID: TIntegerField;
    qryUsuarioExibirFONTE_NOME: TStringField;
    qryUsuarioExibirFONTE_TAMANHO: TSmallintField;
    qryUsuarioExibirTABELA: TStringField;
    qryUsuarioExibirColunaUSUARIO_EXIBIR_COLUNA_ID: TLargeintField;
    qryUsuarioExibirColunaUSUARIO_EXIBIR_ID: TLargeintField;
    qryUsuarioExibirColunaINDICE: TSmallintField;
    qryUsuarioExibirColunaCOLUNA_NOME: TStringField;
    qryUsuarioExibirColunaCOLUNA_LABEL: TStringField;
    qryUsuarioExibirColunaVISIVEL: TSmallintField;
    qryUsuarioExibirColunaTAMANHO: TSmallintField;
    qryUsuarioExibirColunaALINHAMENTO: TStringField;
    qryGrupoProduto: TSQLQuery;
    qrySubGrupoProduto: TSQLQuery;
    DSGrupoProduto: TDataSource;
    DSSubGrupoProduto: TDataSource;
    CDSGrupoProduto: TClientDataSet;
    CDSSubGrupoProduto: TClientDataSet;
    DSPGrupoProduto: TDataSetProvider;
    DSPSubGrupoProduto: TDataSetProvider;
    CDSGrupoProdutoPRODUTO_GRUPO_ID: TIntegerField;
    CDSGrupoProdutoATIVO: TSmallintField;
    CDSGrupoProdutoDATA_CADASTRO: TSQLTimeStampField;
    CDSGrupoProdutoDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSGrupoProdutoDESCRICAO: TStringField;
    CDSSubGrupoProdutoPRODUTO_SUBGRUPO_ID: TIntegerField;
    CDSSubGrupoProdutoATIVO: TSmallintField;
    CDSSubGrupoProdutoDATA_CADASTRO: TSQLTimeStampField;
    CDSSubGrupoProdutoDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSSubGrupoProdutoPRODUTO_GRUPO_ID: TIntegerField;
    CDSSubGrupoProdutoDESCRICAO: TStringField;
    CDSSubGrupoProdutol_grupo_descricao: TStringField;
    CDSPessoaNOME_RAZAO: TStringField;
    qryPessoaImagem: TSQLQuery;
    DSPessoaImagem: TDataSource;
    CDSPessoaImagem: TClientDataSet;
    DSPPessoaImagem: TDataSetProvider;
    CDSPessoaImagemPESSOA_IMAGEM_ID: TIntegerField;
    CDSPessoaImagemPESSOA_ID: TIntegerField;
    CDSPessoaImagemIMAGEM: TBlobField;
    DSPessoaContatoTipo: TDataSource;
    CDSPessoaContatoTipo: TClientDataSet;
    DSPPessoaContatoTipo: TDataSetProvider;
    qryPessoaContatoTipo: TSQLQuery;
    CDSPessoaEnderecoPESSOA_ENDERECO_ID: TIntegerField;
    CDSPessoaEnderecoPESSOA_ID: TIntegerField;
    CDSPessoaEnderecoMUNICIPIO_ID: TIntegerField;
    CDSPessoaEnderecoENDERECO: TStringField;
    CDSPessoaEnderecoNUMERO: TStringField;
    CDSPessoaEnderecoCOMPLEMENTO: TStringField;
    CDSPessoaEnderecoBAIRRO: TStringField;
    CDSPessoaEnderecoCEP: TStringField;
    CDSPessoaContatoPESSOA_CONTATO_ID: TIntegerField;
    CDSPessoaContatoPESSOA_ID: TIntegerField;
    CDSPessoaContatoPESSOA_CONTATO_TIPO_ID: TIntegerField;
    CDSPessoaContatoTipoPESSOA_CONTATO_TIPO_ID: TIntegerField;
    CDSPessoaContatoTipoDESCRICAO: TStringField;
    CDSPessoaEnderecocalc_municipio_nome: TStringField;
    CDSPessoaEnderecocalc_municipio_uf: TStringField;
    CDSPessoaContatoVALOR: TStringField;
    CDSPessoaContatocalc_contato_tipo_descricao: TStringField;
    procedure qryLogAfterOpen(DataSet: TDataSet);
    procedure qryLogAfterClose(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure qryAlteracaoAfterClose(DataSet: TDataSet);
    procedure qryAlteracaoAfterOpen(DataSet: TDataSet);
    procedure CDSPessoaContatoAfterInsert(DataSet: TDataSet);
    procedure CDSPessoaEnderecoAfterInsert(DataSet: TDataSet);
    procedure CDSPessoaAfterInsert(DataSet: TDataSet);
    procedure CDSPessoaAfterCancel(DataSet: TDataSet);
    procedure CDSPessoaAfterDelete(DataSet: TDataSet);
    procedure CDSPessoaAfterPost(DataSet: TDataSet);
    procedure CDSPessoaBeforePost(DataSet: TDataSet);
    procedure CDSPessoaImagemAfterInsert(DataSet: TDataSet);
    procedure CDSPessoaContatoTipoAfterInsert(DataSet: TDataSet);
    procedure CDSPessoaContatoTipoAfterCancel(DataSet: TDataSet);
    procedure CDSPessoaContatoTipoAfterDelete(DataSet: TDataSet);
    procedure CDSPessoaContatoTipoAfterPost(DataSet: TDataSet);
    procedure CDSPessoaContatoTipoBeforeCancel(DataSet: TDataSet);
    procedure CDSPessoaContatoTipoBeforeDelete(DataSet: TDataSet);
    procedure CDSPessoaBeforeCancel(DataSet: TDataSet);
    procedure CDSPessoaBeforeDelete(DataSet: TDataSet);
    procedure CDSPessoaEnderecoCalcFields(DataSet: TDataSet);
    procedure CDSPessoaContatoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    ArquivoIni: TIniFile;
    path : String;
  public
    { Public declarations }
    Transacao: TTransactionDesc;
    EmpresaID : Integer;
    imgNovo, imgAlterar, imgExcluir, imgReverter,
    imgSalvar, imgExcel, imgSair, imgLogin,
    imgOkLogin, imgCancelarLogin, imgFechar, imgCancelar, imgConfirmar,
    imgPesquisar3, imgRecuperar, imgCancelar1, imgCancelar24,
    imgCancelar2, imgOk, imgOk24, imgLimpar : ShortString;
    Id : Integer;
    Tabela, Operacao : ShortString;
    LiberaFormulario, LiberaAlterar, LiberaExportar, ExibeStatus : Boolean;
    SqlConsulta : String;
  end;

var
  BancoDados: TBancoDados;

implementation
uses UFuncoes;
{$R *.dfm}

procedure TBancoDados.CDSPessoaContatoAfterInsert(DataSet: TDataSet);
begin
  with qryGeraID do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select gen_id( GEN_PESSOA_CONTATO_ID, 1 ) from RDB$DATABASE');
      Open;
      CDSPessoaContatoPESSOA_CONTATO_ID.Value := qryGeraID.Fields[0].Value;
      CDSPessoaContatoPESSOA_ID.Value := CDSPessoaPESSOA_ID.Value;

      if not (CDSPessoaContatoTipoPESSOA_CONTATO_TIPO_ID.Value > 0) then
        begin
          Mensagem('Informe um Tipo de Contato!', mtWarning,[mbOk],mrOK,0);
          CDSPessoaContato.Cancel;
          Abort;
        end
      else
        CDSPessoaContatoPESSOA_CONTATO_TIPO_ID.Value := CDSPessoaContatoTipoPESSOA_CONTATO_TIPO_ID.Value;
    end;
end;

procedure TBancoDados.CDSPessoaContatoCalcFields(DataSet: TDataSet);
begin
  with qryAuxiliar do
    begin
      Close;
      SQL.Text := 'select descricao from pessoa_contato_tipo' +
        ' where pessoa_contato_tipo_id = ' +
        IntToStr(BancoDados.CDSPessoaContatoPESSOA_CONTATO_TIPO_ID.Value);
      Open;
    end;
  if not (qryAuxiliar.IsEmpty) then
    BancoDados.CDSPessoaContatocalc_contato_tipo_descricao.Value := qryAuxiliar.Fields[0].Value;
end;

procedure TBancoDados.CDSPessoaContatoTipoAfterCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.Rollback(BancoDados.Transacao);
end;

procedure TBancoDados.CDSPessoaContatoTipoAfterDelete(DataSet: TDataSet);
begin
  CDSPessoaContatoTipo.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TBancoDados.CDSPessoaContatoTipoAfterInsert(DataSet: TDataSet);
begin
  with qryGeraID do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select gen_id( GEN_PESSOA_CONTATO_TIPO_ID, 1 ) from RDB$DATABASE');
      Open;

      CDSPessoaContatoTipoPESSOA_CONTATO_TIPO_ID.Value := qryGeraID.Fields[0].Value;
    end;
end;

procedure TBancoDados.CDSPessoaContatoTipoAfterPost(DataSet: TDataSet);
begin
  CDSPessoaContatoTipo.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TBancoDados.CDSPessoaContatoTipoBeforeCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSPessoaContatoTipoBeforeDelete(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSPessoaEnderecoAfterInsert(DataSet: TDataSet);
begin
  with qryGeraID do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select gen_id( GEN_PESSOA_ENDERECO_ID, 1 ) from RDB$DATABASE');
      Open;
      CDSPessoaEnderecoPESSOA_ENDERECO_ID.Value := qryGeraID.Fields[0].Value;
      CDSPessoaEnderecoPESSOA_ID.Value := CDSPessoaPESSOA_ID.Value;
    end;
end;

procedure TBancoDados.CDSPessoaEnderecoCalcFields(DataSet: TDataSet);
begin
  with qryAuxiliar do
    begin
      Close;
      SQL.Text := 'select nome, uf from municipio where municipio_id = ' +
        IntToStr(CDSPessoaEnderecoMUNICIPIO_ID.Value);
      Open;
    end;

  if not (qryAuxiliar.IsEmpty) then
    begin
      CDSPessoaEnderecocalc_municipio_nome.Value := qryAuxiliar.Fields[0].Value;
      CDSPessoaEnderecocalc_municipio_uf.Value := qryAuxiliar.Fields[1].Value;
    end;
end;

procedure TBancoDados.CDSPessoaAfterCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.Rollback(BancoDados.Transacao);
end;

procedure TBancoDados.CDSPessoaAfterDelete(DataSet: TDataSet);
begin
  CDSPessoa.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TBancoDados.CDSPessoaAfterInsert(DataSet: TDataSet);
begin
  with qryGeraID do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select gen_id( GEN_PESSOA_ID, 1 ) from RDB$DATABASE');
      Open;
      CDSPessoaPESSOA_ID.Value := qryGeraID.Fields[0].Value;
      CDSPessoaATIVO.Value := 1;
      CDSPessoa.FieldByName('DATA_CADASTRO').Value := Now;
      CDSPessoa.FieldByName('DATA_ULTIMA_ALTERACAO').Value := Now;
    end;
end;

procedure TBancoDados.CDSPessoaAfterPost(DataSet: TDataSet);
begin
  CDSPessoa.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TBancoDados.CDSPessoaBeforeCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSPessoaBeforeDelete(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSPessoaBeforePost(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSPessoaImagemAfterInsert(DataSet: TDataSet);
begin
  with qryGeraID do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select gen_id( GEN_PESSOA_IMAGEM_ID, 1 ) from RDB$DATABASE');
      Open;

      CDSPessoaImagemPESSOA_IMAGEM_ID.Value := qryGeraID.Fields[0].Value;
      CDSPessoaImagemPESSOA_ID.Value := CDSPessoaPESSOA_ID.Value;
    end;
end;

procedure TBancoDados.DataModuleCreate(Sender: TObject);
begin
  Transacao.TransactionID := 1;
  Transacao.IsolationLevel := xilReadCommitted;

  Path := RCopy(Application.ExeName, '\');
  if FileExists(Path + 'MasterERP.ini') then
    begin
      ArquivoIni        := TIniFile.Create(Path + 'MasterERP.ini');
      AtivaTrace        := (ArquivoIni.ReadString( 'GERAL', 'TRACE','') = '1');
      imgNovo           := ArquivoIni.ReadString( 'IMAGENS', 'IMGNOVO','');
      imgAlterar        := ArquivoIni.ReadString( 'IMAGENS', 'IMGALTERAR','');
      imgReverter       := ArquivoIni.ReadString( 'IMAGENS', 'IMGREVERTER','');
      imgExcluir        := ArquivoIni.ReadString( 'IMAGENS', 'IMGEXCLUIR','');
      imgSalvar         := ArquivoIni.ReadString( 'IMAGENS', 'IMGSALVAR','');
      imgExcel          := ArquivoIni.ReadString( 'IMAGENS', 'IMGEXCEL','');
      imgSair           := ArquivoIni.ReadString( 'IMAGENS', 'IMGSAIR','');
      imgLogin          := ArquivoIni.ReadString( 'IMAGENS', 'IMGLOGIN','');
      imgOkLogin        := ArquivoIni.ReadString( 'IMAGENS', 'IMGOKLOGIN','');
      imgCancelarLogin  := ArquivoIni.ReadString( 'IMAGENS', 'IMGCANCELARLOGIN','');
      imgFechar         := ArquivoIni.ReadString( 'IMAGENS', 'IMGFECHAR','');
      imgPesquisar3     := ArquivoIni.ReadString( 'IMAGENS', 'IMGPESQUISAR3','');
      imgRecuperar      := ArquivoIni.ReadString( 'IMAGENS', 'IMGRECUPERAR','');
      imgCancelar       := ArquivoIni.ReadString( 'IMAGENS', 'IMGCANCELAR','');
      imgCancelar1      := ArquivoIni.ReadString( 'IMAGENS', 'IMGCANCELAR1','');
      imgCancelar2      := ArquivoIni.ReadString( 'IMAGENS', 'IMGCANCELAR2','');
      imgCancelar24     := ArquivoIni.ReadString( 'IMAGENS', 'IMGCANCELAR24','');
      imgConfirmar      := ArquivoIni.ReadString( 'IMAGENS', 'IMGCONFIRMAR','');
      imgOk             := ArquivoIni.ReadString( 'IMAGENS', 'IMGOK','');
      imgOk24           := ArquivoIni.ReadString( 'IMAGENS', 'IMGOK24','');
      imgLimpar         := ArquivoIni.ReadString( 'IMAGENS', 'IMGLIMPAR','');
    end;
end;

procedure TBancoDados.qryAlteracaoAfterClose(DataSet: TDataSet);
begin
  Conexao.Commit(Transacao);
end;

procedure TBancoDados.qryAlteracaoAfterOpen(DataSet: TDataSet);
begin
  Conexao.StartTransaction(Transacao);
end;

procedure TBancoDados.qryLogAfterClose(DataSet: TDataSet);
begin
  Conexao.Commit(Transacao);
end;

procedure TBancoDados.qryLogAfterOpen(DataSet: TDataSet);
begin
  Conexao.StartTransaction(Transacao);
end;

end.
