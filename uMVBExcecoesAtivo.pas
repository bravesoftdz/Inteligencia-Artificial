{-----------------------------------------------------------------------------
 Unit Name: uMVBExcecoesAtivo
 Author:    Vin�cius
 Purpose:
 History:
-----------------------------------------------------------------------------}

unit uMVBExcecoesAtivo;

interface

uses
  { mvb }
  uMVBClasses;

type
  { classes de exce��es }
  EMVBExcecaoAtivo = class(EMVBException);

  EMVBExcecaoAtivoNaoEncontrado = class(EMVBExcecaoAtivo)
  public
    constructor Create; reintroduce; overload;
  end;

  EMVBExcecaoAtivoJaCadastrado = class(EMVBExcecaoAtivo)
  public
    constructor Create; reintroduce; overload;
  end;

  EMVBExcecaoAtivoSiglaNaoInformada = class(EMVBExcecaoAtivo)
  public
    constructor Create; reintroduce; overload;
  end;

  EMVBExcecaoAtivoDescricaoNaoInformada = class(EMVBExcecaoAtivo)
  public
    constructor Create; reintroduce; overload;
  end;

  EMVBExcecaoAtivoTipoNaoInformado = class(EMVBExcecaoAtivo)
  public
    constructor Create; reintroduce; overload;
  end;

  EMVBExcecaoAtivoSiglaCaracteresExcedendo = class(EMVBExcecaoAtivo)
  public
    constructor Create(ATamanho: Integer); reintroduce; overload;
  end;

  EMVBExcecaoAtivoDescricaoCaracteresExcedendo = class(EMVBExcecaoAtivo)
  public
    constructor Create(ATamanho: Integer); reintroduce; overload;
  end;

implementation

uses
  { borland }
  SysUtils;

resourcestring
  SuMVBExcecoesAtivo_InformeADescricao = 'Informe a descri��o.';
  SuMVBExcecoesAtivo_AtivoJaCadastrado = 'Ativo j� cadastrado.';
  SuMVBExcecoesAtivo_AtivoNaoEncontrado = 'Ativo n�o encontrado.';
  SuMVBExcecoesAtivo_InformeASigla = 'Informe a sigla.';
  SuMVBExcecoesAtivo_InformeOTipo = 'Informe o tipo.';
  SuMVBExcecoesAtivo_OCampoDeveTerUmNumeroDeCarectere =
    'O campo %S deve ter um n�mero de carecteres menor ou igual a %d.';
  FC_PROP_SIGLA = 'Sigla';
  FC_PROP_DESCRICAO = 'Descri��o';

  { EMVBExcecaoAtivoNaoEncontrado }

constructor EMVBExcecaoAtivoNaoEncontrado.Create;
begin
  Self.Message := SuMVBExcecoesAtivo_AtivoNaoEncontrado;
end;

{ EMVBExcecaoAtivoJaCadastrado }

constructor EMVBExcecaoAtivoJaCadastrado.Create;
begin
  Self.Message := SuMVBExcecoesAtivo_AtivoJaCadastrado;
end;

{ EMVBExcecaoAtivoSiglaNaoInformada }

constructor EMVBExcecaoAtivoSiglaNaoInformada.Create;
begin
  Self.Message := SuMVBExcecoesAtivo_InformeASigla;
end;

{ EMVBExcecaoAtivoSiglaCaracteresExcedendo }

constructor EMVBExcecaoAtivoSiglaCaracteresExcedendo.Create(
  ATamanho: Integer);
begin
  Self.Message := Format(SuMVBExcecoesAtivo_OCampoDeveTerUmNumeroDeCarectere,
    [FC_PROP_SIGLA, ATamanho]);
end;

{ EMVBExcecaoAtivoDescricaoCaracteresExcedendo }

constructor EMVBExcecaoAtivoDescricaoCaracteresExcedendo.Create(
  ATamanho: Integer);
begin
  Self.Message := Format(SuMVBExcecoesAtivo_OCampoDeveTerUmNumeroDeCarectere,
    [FC_PROP_DESCRICAO, ATamanho]);
end;

{ EMVBExcecaoAtivoTipoNaoInformado }

constructor EMVBExcecaoAtivoTipoNaoInformado.Create;
begin
  Self.Message := SuMVBExcecoesAtivo_InformeOTipo;
end;

{ EMVBExcecaoAtivoDescricaoNaoInformada }

constructor EMVBExcecaoAtivoDescricaoNaoInformada.Create;
begin
  Self.Message := SuMVBExcecoesAtivo_InformeADescricao;
end;

end.


