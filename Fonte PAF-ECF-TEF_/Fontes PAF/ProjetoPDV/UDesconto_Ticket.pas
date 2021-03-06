unit UDesconto_Ticket;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxToolEdit, rxCurrEdit;

type
  TFDesconto_Ticket = class(TForm)
    P1: TPanel;
    EDesconto: TCurrencyEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EDescontoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDesconto_Ticket: TFDesconto_Ticket;

implementation

{$R *.dfm}

procedure TFDesconto_Ticket.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_Escape
     then Close;
end;

procedure TFDesconto_Ticket.EDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13
     then Close;
end;

end.
