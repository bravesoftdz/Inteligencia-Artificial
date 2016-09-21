{-----------------------------------------------------------------------------
 Unit Name: uMVBExcecoesSaida
 Author:    Vin�cius
 Purpose:
 History:
-----------------------------------------------------------------------------}

unit uMVBExcecoesSaida;

interface

uses
  { mvb }
  uMVBClasses;

type
  { classes de exce��es }
  EMVBExcecaoSaida = class(EMVBException);

  EMVBExcecaoSaidaNaoEncontrada = class(EMVBExcecaoSaida)
  public
    constructor Create; reintroduce; overload;
  end;

  EMVBExcecaoSaidaJaCadastrada = class(EMVBExcecaoSaida)
  public
    constructor Create; reintroduce; overload;
  end;

  EMVBExcecaoSaidaDescricaoNaoInformada = class(EMVBExcecaoSaida)
  public
    constructor Create; reintroduce; overload;
  end;

  EMVBExcecaoSaidaValorNaoInformado = class(EMVBExcecaoSaida)
  public
    constructor Create; reintroduce; overload;
  end;

  EMVBExcecaoSaidaDescricaoCaracteresExcedendo = class(EMVBExcecaoSaida)
  public
    constructor Create(ATamanho: Integer); reintroduce; overload;
  end;

implementation

uses
  { borland }
  SysUtils;

resourcestring
  SuMVBExcecoesSaida_OCampoDeveTerUmNumeroDeCarectere =
    'O campo %S deve ter um n�mero de carecteres menor ou igual a %d.';
  SuMVBExcecoesSaida_InformeADescricao = 'Informe a descri��o.';
  SuMVBExcecoesSaida_InformeOValor = 'Informe o valor.';
  SuMVBExcecoesSaida_SaidaJaCadastrada = 'Sa�da j� cadastrada.';
  SuMVBExcecoesSaida_SaidaNaoEncontrada = 'Sa�da n�o encontrada.';
  FC_PROP_DESCRICAO = 'Descri��o';

  { EMVBExcecaoSaidaNaoEncontrada }

constructor EMVBExcecaoSaidaNaoEncontrada.Create;
begin
  Self.Message := SuMVBExcecoesSaida_SaidaNaoEncontrada;
end;

{ EMVBExcecaoSaidaJaCadastrada }

constructor EMVBExcecaoSaidaJaCadastrada.Create;
begin
  Self.Message := SuMVBExcecoesSaida_SaidaJaCadastrada;
end;

{ EMVBExcecaoSaidaValorNaoInformado }

constructor EMVBExcecaoSaidaValorNaoInformado.Create;
begin
  Self.Message := SuMVBExcecoesSaida_InformeOValor;
end;

{ EMVBExcecaoSaidaDescricaoNaoInformada }

constructor EMVBExcecaoSaidaDescricaoNaoInformada.Create;
begin
  Self.Message := SuMVBExcecoesSaida_InformeADescricao;
end;

{ EMVBExcecaoSaidaDescricaoCaracteresExcedendo }

constructor EMVBExcecaoSaidaDescricaoCaracteresExcedendo.Create(
  ATamanho: Integer);
begin
  Self.Message := Format(SuMVBExcecoesSaida_OCampoDeveTerUmNumeroDeCarectere,
    [FC_PROP_DESCRICAO, ATamanho]);
end;

end.

