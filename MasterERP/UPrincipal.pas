unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RibbonLunaStyleActnCtrls, Ribbon, ToolWin, ActnMan, ActnCtrls,
  ActnList, Menus, PlatformDefaultStyleActnCtrls, ImgList, IniFiles, ComCtrls,
  ScreenTips, ExtCtrls;

type
  TPrincipalForm = class(TForm)
    SBPrincipal: TStatusBar;
    MainMenuPrincipal: TMainMenu;
    Cadastros1: TMenuItem;
    Ajuda1: TMenuItem;
    Arquivo1: TMenuItem;
    rocarUsurio1: TMenuItem;
    Sair1: TMenuItem;
    PAtalhos: TPanel;
    TimerPrincipal: TTimer;
    ImageListPrincipal: TImageList;
    ActionListPrincipal: TActionList;
    ATrocarUsuario: TAction;
    ASair: TAction;
    AUsuario: TAction;
    Configuraes1: TMenuItem;
    Usurios1: TMenuItem;
    ConfigurarTrace1: TMenuItem;
    AConfigurarTrace: TAction;
    AEmpresa: TAction;
    AContatoTipo: TAction;
    AMunicipio: TAction;
    Estoque1: TMenuItem;
    AProduto: TAction;
    CadastrodeProdutos1: TMenuItem;
    Empresa2: TMenuItem;
    iposdeContatos1: TMenuItem;
    Cidades1: TMenuItem;
    AGrupoProduto: TAction;
    ASubGrupoProduto: TAction;
    Manuteno1: TMenuItem;
    GruposdeProdutos2: TMenuItem;
    SubGruposdeProdutos2: TMenuItem;
    ACliente: TAction;
    Cliente1: TMenuItem;
    ALogSistema: TAction;
    Ferramentas1: TMenuItem;
    LogdoSistema1: TMenuItem;
    AFornecedor: TAction;
    Fornecedores1: TMenuItem;
    ATransportadora: TAction;
    ransportadoras1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure AUsuarioExecute(Sender: TObject);
    procedure ATrocarUsuarioExecute(Sender: TObject);
    procedure ASairExecute(Sender: TObject);
    procedure AConfigurarTraceExecute(Sender: TObject);
    procedure AContatoTipoExecute(Sender: TObject);
    procedure AMunicipioExecute(Sender: TObject);
    procedure AProdutoExecute(Sender: TObject);
    procedure AGrupoProdutoExecute(Sender: TObject);
    procedure AEmpresaExecute(Sender: TObject);
    procedure ASubGrupoProdutoExecute(Sender: TObject);
    procedure AClienteExecute(Sender: TObject);
    procedure ALogSistemaExecute(Sender: TObject);
    procedure AFornecedorExecute(Sender: TObject);
    procedure ATransportadoraExecute(Sender: TObject);
  private
    { Private declarations }
    ArquivoIni: TIniFile;
    path : String;
    procedure LogarUsuario;
  public
    { Public declarations }
  end;

var
  PrincipalForm: TPrincipalForm;
  Logado : Boolean = False;
  DataSistema : TDate;
  UsuarioID : Integer;

  {EXIBIR_COLUNA (Campo TABELA_FUNCAO)
    0: Janela de Consulta Principal.
    1: Janela de Pesquisa.
  }

implementation
uses Base, Base64, UFuncoes, UConexao, ULogin, UConcultaUsuario, UConfiguraTrace,
  UConsultaEmpresa, UCadastroSimplesContatoTipo, UCadastroSimplesMunicipio,
  UConsultaProduto, UConsultaGrupoProduto, UConsultaSubGrupoProduto,
  UCadastroSimplesPessoaContatoTipo, UConsultaCliente, UConsultaLog,
  UConsultaFornecedor, UConsultaTransportadora;
{$R *.dfm}

procedure TPrincipalForm.LogarUsuario;
begin
  try
   if not Assigned(LoginForm) then
     LoginForm := TLoginForm.Create(Application);
   LoginForm.ShowModal;
   if (Logado) then
     begin
       Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, BancoDados.Tabela,
          'Login Efetuado: Login = ' + BancoDados.qryLoginLOGIN.Value + '.');

       UsuarioID := BancoDados.qryLoginUSUARIO_ID.Value;

       SBPrincipal.Panels[0].Text := ' Empresa: ' + BancoDados.EmpresaNomeRazao;
       SBPrincipal.Panels[1].Text := ' Vendedor: ' + BancoDados.qryLoginLOGIN.Value;
       SBPrincipal.Panels[2].Text := ' Data: ' + FormatDateTime('dd/mm/yyyy',Date) + '.';
       DataSistema := Date;
     end
   else
     begin
       if (UsuarioID > 0) then
         LoginForm.Close
       else
         Application.Terminate;
     end;
 finally
   LoginForm.Free;
   LoginForm := nil;
 end;
end;

procedure TPrincipalForm.AClienteExecute(Sender: TObject);
begin
  CriaForm(TConsultaClienteForm, ConsultaClienteForm);
end;

procedure TPrincipalForm.AConfigurarTraceExecute(Sender: TObject);
begin
  CriaForm(TConfiguraTraceForm, ConfiguraTraceForm);
end;

procedure TPrincipalForm.AMunicipioExecute(Sender: TObject);
begin
  CriaForm(TCadastroSimplesMunicipioForm, CadastroSimplesMunicipioForm);
end;

procedure TPrincipalForm.AProdutoExecute(Sender: TObject);
begin
  CriaForm(TConsultaProdutoForm, ConsultaProdutoForm);
end;

procedure TPrincipalForm.AContatoTipoExecute(Sender: TObject);
begin
  CriaForm(TCadastroSimplesPessoaContatoTipoForm, CadastroSimplesPessoaContatoTipoForm);
end;

procedure TPrincipalForm.AEmpresaExecute(Sender: TObject);
begin
  CriaForm(TConsultaEmpresaForm, ConsultaEmpresaForm);
end;

procedure TPrincipalForm.AFornecedorExecute(Sender: TObject);
begin
  CriaForm(TConsultaFornecedorForm, ConsultaFornecedorForm);
end;

procedure TPrincipalForm.AGrupoProdutoExecute(Sender: TObject);
begin
  CriaForm(TConsultaGrupoProdutoForm, ConsultaGrupoProdutoForm);
end;

procedure TPrincipalForm.ALogSistemaExecute(Sender: TObject);
begin
  if (BancoDados.qryLoginNIVEL.Value <> 'ADM') then
    begin
      Mensagem('Fun��o dispon�vel apenas para Usu�rios Administradores!', mtWarning,[mbOk],mrOK,0);
      Abort;
    end
  else
    begin
      try
       if not Assigned(ConsultaLogForm) then
         ConsultaLogForm := TConsultaLogForm.Create(Application);
       ConsultaLogForm.ShowModal;
     finally
       ConsultaLogForm.Free;
       ConsultaLogForm := nil;
     end;
    end;
end;

procedure TPrincipalForm.ASairExecute(Sender: TObject);
begin
  Close;
end;

procedure TPrincipalForm.ASubGrupoProdutoExecute(Sender: TObject);
begin
  CriaForm(TConsultaSubGrupoProdutoForm, ConsultaSubGrupoProdutoForm);
end;

procedure TPrincipalForm.ATransportadoraExecute(Sender: TObject);
begin
  CriaForm(TConsultaTransportadoraForm, ConsultaTransportadoraForm);
end;

procedure TPrincipalForm.ATrocarUsuarioExecute(Sender: TObject);
begin
  BancoDados.qryLogin.Close;
  Logado := False;
  LogarUsuario;
end;

procedure TPrincipalForm.AUsuarioExecute(Sender: TObject);
begin
  CriaForm(TConcultaUsuarioForm, ConcultaUsuarioForm);
end;

procedure TPrincipalForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  case Application.MessageBox('Deseja Sair do Sistema?','Aten��o',MB_YesNo+mb_DefButton2+mb_IconQuestion) of
     6: begin
          Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, BancoDados.Tabela,
            'Saindo do Sistema: ' + IntToStr(BancoDados.qryLoginUSUARIO_ID.Value) +
            '/' + BancoDados.qryLoginLOGIN.Value + '.');
          BancoDados.CDSUsuario.Close;
          BancoDados.qryLogin.Close;
          Application.Terminate;
     end;
     7:Abort;
  end;
end;

procedure TPrincipalForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #27) then
    begin
      key := #0;
      Close;
    end;
end;

procedure TPrincipalForm.FormShow(Sender: TObject);
begin
  Path := RCopy(Application.ExeName, '\');
  if FileExists(Path + 'MasterERP.ini') then
    begin
      ArquivoIni := TIniFile.Create(Path + 'MasterERP.ini');
      BancoDados.Conexao.Params.Values['DataBase'] := ArquivoIni.ReadString('Conexao', 'DataBase', '');

      try
        BancoDados.Conexao.Connected := True;
      except
        Raise Exception.Create('Erro durante a conex�o com o Banco de Dados, verifique sua conex�o!');
      end;
    end
  else
    begin
      try
        if not Assigned(ConexaoForm) then
          ConexaoForm := TConexaoForm.Create(Application);
        if (ConexaoForm.ShowModal = mrOk) then
          begin
            if not(BancoDados.Conexao.Connected) then
              begin
                ArquivoIni := TIniFile.Create(Path + 'MasterERP.ini');
                BancoDados.Conexao.Params.Values['DataBase'] := ArquivoIni.ReadString('Conexao', 'DataBase', BancoDados.Conexao.Params.Values['DataBase']);
                try
                  BancoDados.Conexao.Connected := True;
                except
                  Raise Exception.Create('Erro durante a conex�o com o Banco de Dados, verifique sua conex�o!');
                end;
              end;
          end
        else
            Application.Terminate;
      finally
        ConexaoForm.Free;
        ConexaoForm := nil;
      end;
    end;
  LogarUsuario;
  Caption := 'MasterSoft - M�dulo MasterERP';
end;

end.