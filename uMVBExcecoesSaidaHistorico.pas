{-----------------------------------------------------------------------------
 Unit Name: uMVBExcecoesSaidaHistorico
 Author:    Vin�cius
 Purpose:
 History:
-----------------------------------------------------------------------------}

unit uMVBExcecoesSaidaHistorico;

interface

uses
  { mvb }
  uMVBClasses;

type
  { classes de exce��es }
  EMVBExcecaoSaidaHistorico = class(EMVBException);

  EMVBExcecaoSaidaHistoricoNaoEncontrada = class(EMVBExcecaoSaidaHistorico)
  public
    constructor Create; reintroduce; overload;
  end;

  EMVBExcecaoSaidaHistoricoJaCadastrada = class(EMVBExcecaoSaidaHistorico)
  public
    constructor Create; reintroduce; overload;
  end;

implementation

resourcestring
  SuMVBExcecoesSaidaHistorico_SaidaHistoricoJaCadastrada =
    'Sa�da/Hist�rico j� cadastrada.';
  SuMVBExcecoesSaidaHistorico_SaidaHistoricoNaoEncontrada =
    'Sa�da/Hist�rico n�o encontrada.';

  { EMVBExcecaoSaidaHistoricoNaoEncontrada }

constructor EMVBExcecaoSaidaHistoricoNaoEncontrada.Create;
begin
  Self.Message := SuMVBExcecoesSaidaHistorico_SaidaHistoricoNaoEncontrada;
end;

{ EMVBExcecaoSaidaHistoricoJaCadastrada }

constructor EMVBExcecaoSaidaHistoricoJaCadastrada.Create;
begin
  Self.Message := SuMVBExcecoesSaidaHistorico_SaidaHistoricoJaCadastrada;
end;

end.

