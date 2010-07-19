unit UPesquisaPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, JvExControls, JvGradientHeaderPanel, ExtCtrls,
  ComCtrls, Grids, DBGrids, FMTBcd, DB, DBClient, Provider, SqlExpr, AppEvnts,
  Menus, ActnList;

type
  TPesquisaPadraoForm = class(TForm)
    SBPrincipal: TStatusBar;
    Panel1: TPanel;
    JvGradientHeaderPanel1: TJvGradientHeaderPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BTPesquisar: TSpeedButton;
    Label4: TLabel;
    CBCriterio: TComboBox;
    CBCondicao: TComboBox;
    EditValor: TEdit;
    CBSituacao: TComboBox;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    qryConsulta: TSQLQuery;
    DSPConsulta: TDataSetProvider;
    CDSConsulta: TClientDataSet;
    DSqryConsulta: TDataSource;
    ApplicationEvents: TApplicationEvents;
    PopupMenu1: TPopupMenu;
    ExibirColunas1: TMenuItem;
    ReconfigurarColunas1: TMenuItem;
    ActionList: TActionList;
    BTConfirmar: TSpeedButton;
    BTCancelar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApplicationEventsHint(Sender: TObject);
    procedure ExibirColunas1Click(Sender: TObject);
    procedure ReconfigurarColunas1Click(Sender: TObject);
    procedure CBSituacaoSelect(Sender: TObject);
    procedure CBCriterioSelect(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BTConfirmarClick(Sender: TObject);
    procedure BTCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure CarregaPreferencias;
  public
    { Public declarations }
  end;

var
  PesquisaPadraoForm: TPesquisaPadraoForm;

implementation
uses Base, UFuncoes, UFuncaoExibirColuna, UsuarioExibirColuna;
{$R *.dfm}

procedure TPesquisaPadraoForm.CarregaPreferencias;
begin
  CBCriterio.ItemIndex := StrToInt(LerOpcaoUsuario(BancoDados.qryExecute,
    BancoDados.qryLoginUSUARIO_ID.Value, 1, 'Consulta - Crit�rio', '0', BancoDados.Tabela));

  CBSituacao.ItemIndex := StrToInt(LerOpcaoUsuario(BancoDados.qryExecute, BancoDados.qryLoginUSUARIO_ID.Value, 2,
    'Consulta - Ativo', '0', BancoDados.Tabela));
end;

procedure TPesquisaPadraoForm.BTCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TPesquisaPadraoForm.BTConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TPesquisaPadraoForm.ApplicationEventsHint(Sender: TObject);
begin
  if (BancoDados.ExibeStatus) then
    SBPrincipal.Panels[0].Text := Application.Hint;
end;

procedure TPesquisaPadraoForm.CBCriterioSelect(Sender: TObject);
begin
  EditValor.SetFocus;
end;

procedure TPesquisaPadraoForm.CBSituacaoSelect(Sender: TObject);
begin
  EditValor.SetFocus;
end;

procedure TPesquisaPadraoForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check : Integer;
  R: TRect;
begin
  if Column.FieldName = 'ATIVO' then
    begin
      DBGrid1.Canvas.FillRect(Rect);
      Check := 0;
      if (CDSConsulta.FieldByName('ATIVO').Value = 1) then
        Check := DFCS_CHECKED
      else
        Check := 0;
      R := Rect;
      InflateRect(R,-3,-3);
      DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
    end;
end;

procedure TPesquisaPadraoForm.ExibirColunas1Click(Sender: TObject);
begin
  try
    GeraTrace(BancoDados.Tabela,'Alterando Configura��es da Grade');
    BancoDados.ExibeStatus := False;
    CriaForm(TUsuarioExibirColunaForm, UsuarioExibirColunaForm);
  finally
    BancoDados.ExibeStatus := True;
    ConfiguraGrade(DBGrid1, BancoDados.qryLoginUSUARIO_ID.Value, BancoDados.Tabela);
    GeraTrace(BancoDados.Tabela,'Configura��es da Grade Alteradas');
  end;
end;

procedure TPesquisaPadraoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  GravarOpcaoUsuario(BancoDados.qryExecute, BancoDados.qryLoginUSUARIO_ID.Value, 1,
    IntToStr(CBCriterio.ItemIndex), BancoDados.Tabela);

  GravarOpcaoUsuario(BancoDados.qryExecute, BancoDados.qryLoginUSUARIO_ID.Value, 2,
    IntToStr(CBSituacao.ItemIndex), BancoDados.Tabela);

  GeraTrace(BancoDados.Tabela,'Formul�rio de Pesquisa Encerrado');
  GeraTrace(BancoDados.Tabela,CriaLinha(110));
end;

procedure TPesquisaPadraoForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 38) then
    begin
      key := 0;
      CDSConsulta.Prior;
    end
  else if (key = 40) then
    begin
      key := 0;
      CDSConsulta.Next;
    end;
end;

procedure TPesquisaPadraoForm.FormShow(Sender: TObject);
begin
  GeraTrace(BancoDados.Tabela,CriaLinha(110));
  GeraTrace(BancoDados.Tabela,'Abrindo Formul�rio de Pesquisa');

  ApplicationEvents.Activate;
  CBCriterio.ItemIndex := StrToInt(LerOpcaoUsuario(BancoDados.qryExecute,
    BancoDados.qryLoginUSUARIO_ID.Value, 1, 'Consulta - Crit�rio', '0', BancoDados.Tabela));
  CBSituacao.ItemIndex := StrToInt(LerOpcaoUsuario(BancoDados.qryExecute, BancoDados.qryLoginUSUARIO_ID.Value, 2,
    'Consulta - Ativo', '0', BancoDados.Tabela));

  ConfiguraGrade(DBGrid1, BancoDados.qryLoginUSUARIO_ID.Value, BancoDados.Tabela);
  CarregaPreferencias;

  GeraTrace(BancoDados.Tabela,'Formul�rio de Pesquisa');
end;

procedure TPesquisaPadraoForm.ReconfigurarColunas1Click(Sender: TObject);
begin
  try
    GeraTrace(BancoDados.Tabela,'Alterando Configura��es da Grade');
    BancoDados.CDSUsuarioExibir.Close;
    BancoDados.qryUsuarioExibir.SQL.Text := 'select * from usuario_exibir ' +
      ' where usuario_id = ' + IntToStr(BancoDados.qryLoginUSUARIO_ID.Value) +
      ' and tabela = ' + QuotedStr(BancoDados.Tabela);
    BancoDados.CDSUsuarioExibir.Open;

    BancoDados.Conexao.StartTransaction(BancoDados.Transacao);

    BancoDados.qryExecute.SQL.Text := 'delete from usuario_exibir_coluna where usuario_exibir_id = ' +
      IntToStr(BancoDados.CDSUsuarioExibirUSUARIO_EXIBIR_ID.Value) + ';';
    BancoDados.qryExecute.ExecSQL(True);

    BancoDados.qryExecute.SQL.Text := 'delete from usuario_exibir where usuario_exibir_id = ' +
      IntToStr(BancoDados.CDSUsuarioExibirUSUARIO_EXIBIR_ID.Value) + ';';
    BancoDados.qryExecute.ExecSQL(True);

    BancoDados.Conexao.Commit(BancoDados.Transacao);

    ConfiguraGrade(DBGrid1, BancoDados.qryLoginUSUARIO_ID.Value, BancoDados.Tabela);

    Mensagem('Altera��es gravadas com Sucesso!', mtInformation,[mbOk],mrOK,0);

    GeraTrace(BancoDados.Tabela,'Configura��es da Grade Alteradas');

  except
    Mensagem('Erro ao tentar Reconfigurar a Grade!', mtWarning,[mbOk],mrOK,0);
    BancoDados.Conexao.Rollback(BancoDados.Transacao);
    Abort;
  end;
end;

end.