unit UFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls;

type
  TFrmPrincipal = class(TForm)
    RadTipo: TRadioGroup;
    LblDocumento: TLabel;
    EdtDocumento: TMaskEdit;
    BtnValidar: TBitBtn;
    BtnLimpar: TBitBtn;
    procedure BtnLimparClick(Sender: TObject);
    procedure RadTipoClick(Sender: TObject);
  private
    { Private declarations }
   function ValidaCPF(cpf: string): boolean;
   function ValidaCNPJ(cnpj: string): boolean;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.BtnLimparClick(Sender: TObject);
begin
 EdtDocumento.Clear;
 EdtDocumento.SetFocus;
end;

procedure TFrmPrincipal.RadTipoClick(Sender: TObject);
begin
  if RadTipo.ItemIndex = 0 then
  begin
    LblDocumento.Caption := 'Digite o CPF';
    EdtDocumento.EditMask := '999.999.999-99;0;_';
  end
  else
  begin
    LblDocumento.Caption := 'Digite o CNPJ';
    EdtDocumento.EditMask := '99.999.999/9999-99;0;_';
  end;
end;

function TfrmPrincipal.ValidaCNPJ(cnpj: string): boolean;
var i, soma, peso, divisor, digito: integer;
begin
  result := false;

  if (Length(cnpj) <> 14) then //Verifica se o CNPJ contem os 14 digitos
  begin
    Application.MessageBox('CNPJ Inválido, informe todos os números',
      'Validador CNPJ', MB_ICONWARNING);
    exit;
  end;

  //Verificando o digito 13
  soma := 0;
  peso := 5;

  for i := 1 to 12 do
  begin
    soma := soma + (StrToInt(cnpj[i]) * peso);
    dec(peso); //ou peso := peso - 1;
    if (peso = 1) then peso := 9;//Altera o peso para 9 quando terminar o 2
  end;

  divisor := soma mod 11;

  if divisor < 2 then
    digito := 0
  else
    digito := 11 - divisor;

  if (digito <> StrToInt(cnpj[13])) then
  begin
    Application.MessageBox('CNPJ Inválido, confira os números informados',
      'Validador CNPJ', MB_ICONWARNING);
    exit;
  end;

  // Verificando o digito 14
  soma := 0;
  peso := 6;

  for i := 1 to 13 do
  begin
    soma := soma + (StrToInt(cnpj[i]) * peso);
    dec(peso); // peso := peso - 1;
    if (peso = 1) then peso := 9; //Altera o peso para 9 quando terminar o 2
  end;

  divisor := soma mod 11;

  if divisor < 2 then
    digito := 0
  else
    digito := 11 - divisor;

  if (digito <> StrToInt(cnpj[14])) then
  begin
    Application.MessageBox('CNPJ Inválido, confira os números informados',
      'Validador CNPJ', MB_ICONWARNING);
    exit;
  end;

  // Chegou aqui, então o CNPJ é válido
  Application.MessageBox('CNPJ Válido', 'Validador CNPJ',
    MB_ICONINFORMATION);
  result := true;
end;

function TfrmPrincipal.ValidaCPF(cpf: string): boolean;
var i, soma, peso, divisor, digito : Integer;
begin
  result := false; //Deixa o retorno já marcado como falso

  if (Length(cpf) <> 11) then //Verifica se o CPF contem os 11 digitos
  begin
    Application.MessageBox('CPF Inválido, informe todos os números',
      'Validador CPF', MB_ICONWARNING);
    exit;
    //O exit encerra a função e o result devolve o valor falso
  end;

  //Verificando o digito 10
  soma := 0;
  peso := 10;

  for i := 1 to 9 do
  begin
    soma := soma + (StrToInt(cpf[i]) * peso);
    dec(peso); //ou peso := peso - 1;
  end;

  divisor := soma mod 11;

  if divisor < 2 then
    digito := 0
  else
    digito := 11 - divisor;

  if (digito <> StrToInt(cpf[10])) then
  begin
    Application.MessageBox('CPF Inválido, confira os números informados',
      'Validador CPF', MB_ICONWARNING);
      exit;
  end;

  // Verificando o digito 11
  soma := 0;
  peso := 11;

  for i := 1 to 10 do
  begin
    soma := soma + (StrToInt(cpf[i]) * peso);
    dec(peso); // peso := peso - 1;
  end;

  divisor := soma mod 11;

  if divisor < 2 then
    divisor := 0
  else
    digito := 11 - divisor;

  if (digito <> StrToInt(cpf[11])) then
  begin
    Application.MessageBox('CPF Inválido, confira os números informados',
      'Validador CPF', MB_ICONWARNING);
    exit;
  end;
  //Chegou aqui, então o CPF é válido

  Application.MessageBox('CPF Válido', 'Validador CPF',
    MB_ICONINFORMATION);
  result := true; // Chegando até o final o retorno é verdadeiro
end;

end.

