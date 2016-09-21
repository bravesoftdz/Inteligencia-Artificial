{-----------------------------------------------------------------------------
 Unit Name: uMVBPerceptron
 Author:    Marcus Vinicius Braga (mvbraga@gmail.com)
 Purpose:
 History:
-----------------------------------------------------------------------------}

unit uMVBPerceptron;

interface

uses
  Classes;

type
  TPerceptron = class(TPersistent)
  private
    FAjusteFino: Double;
    FSaidaIntermediaria: Double;
    FEntradas: TStringList;
    FPesos: TStringList;
    FSaida: Integer;
    procedure InserirValor(ALista: TStringList; AIndex: Integer;
      AValue: Double);
    function RecuperarValor(ALista: TStringList; AIndex: Integer): Double;
    function GetEntradas(AIndex: Integer): Double;
    function GetPesos(AIndex: Integer): Double;
    procedure SetAjusteFino(const Value: Double);
    procedure SetEntradas(AIndex: Integer; const Value: Double);
    procedure SetPesos(AIndex: Integer; const Value: Double);
  protected
    procedure Somar; virtual;
    procedure RecuperarSaidaAtivada; virtual;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Clear; virtual;
    procedure Execute;
    property Entradas[AIndex: Integer]: Double read GetEntradas write
    SetEntradas;
    property Pesos[AIndex: Integer]: Double read GetPesos write SetPesos;
    property AjusteFino: Double read FAjusteFino write SetAjusteFino;
    { somente leitura }
    property SaidaIntermediaria: Double read FSaidaIntermediaria;
    property Saida: Integer read FSaida;
  published
  end;

implementation

uses
  SysUtils;

resourcestring
  SuPerceptron_AEntradaNaoFoiEncontrada = 'A entrada %d n�o foi encontrada.';
  SuPerceptron_AQuantidadeDePesosNaoeIgualADeEn =
    'A quantidade de pesos n�o � igual a de entradas.';
  SuPerceptron_OPesoNaoFoiEncontrado = 'O peso %d n�o foi encontrado.';

  { TPerceptron }

  {-----------------------------------------------------------------------------
    Procedure: TPerceptron.Clear
    Author:    Vin�cius
    Date:      27-nov-2003
    Arguments: None
    Result:    None
  -----------------------------------------------------------------------------}

procedure TPerceptron.Clear;
begin
  FEntradas.Clear;
  FPesos.Clear;
  FAjusteFino := 0;
  FSaidaIntermediaria := 0;
end;

{-----------------------------------------------------------------------------
  Procedure: TPerceptron.Create
  Author:    Vin�cius
  Date:      27-nov-2003
  Arguments: None
  Result:    None
-----------------------------------------------------------------------------}

constructor TPerceptron.Create;
begin
  inherited;
  FEntradas := TStringList.Create;
  FPesos := TStringList.Create;
end;

{-----------------------------------------------------------------------------
  Procedure: TPerceptron.Destroy
  Author:    Vin�cius
  Date:      27-nov-2003
  Arguments: None
  Result:    None
-----------------------------------------------------------------------------}

destructor TPerceptron.Destroy;
begin
  FEntradas.Free;
  FPesos.Free;
  inherited;
end;

{-----------------------------------------------------------------------------
  Procedure: TPerceptron.Execute
  Author:    Vin�cius
  Date:      27-nov-2003
  Arguments: None
  Result:    None
-----------------------------------------------------------------------------}

procedure TPerceptron.Execute;
begin
  { executa a soma }
  Self.Somar;
  { recupera a saida }
  Self.RecuperarSaidaAtivada;
end;

{-----------------------------------------------------------------------------
  Procedure: TPerceptron.GetEntradas
  Author:    Vin�cius
  Date:      27-nov-2003
  Arguments: AIndex: Integer
  Result:    Integer
-----------------------------------------------------------------------------}

function TPerceptron.GetEntradas(AIndex: Integer): Double;
begin
  Result := Self.RecuperarValor(FEntradas, AIndex);
  if Result = -1 then
  begin
    raise Exception.Create(Format(SuPerceptron_AEntradaNaoFoiEncontrada,
      [AIndex]));
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: TPerceptron.GetPesos
  Author:    Vin�cius
  Date:      27-nov-2003
  Arguments: AIndex: Integer
  Result:    Double
-----------------------------------------------------------------------------}

function TPerceptron.GetPesos(AIndex: Integer): Double;
begin
  Result := Self.RecuperarValor(FPesos, AIndex);
  if Result = -1 then
  begin
    raise Exception.Create(Format(SuPerceptron_OPesoNaoFoiEncontrado,
      [AIndex]));
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: TPerceptron.InserirValor
  Author:    Vin�cius
  Date:      30-nov-2003
  Arguments: ALista: TStringList; AIndex: Integer; AValue: Double
  Result:    None
-----------------------------------------------------------------------------}

procedure TPerceptron.InserirValor(ALista: TStringList;
  AIndex: Integer; AValue: Double);
begin
  { se � um valor v�lido }
  if AIndex > -1 then
  begin
    { se � para alterar }
    if AIndex <= ALista.Count - 1 then
    begin
      ALista[AIndex] := FloatToStr(AValue);
    end
      { se for um outro valor }
    else
    begin
      ALista.Add(FloatToStr(AValue));
    end;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: TPerceptron.RecuperarValor
  Author:    Vin�cius
  Date:      30-nov-2003
  Arguments: ALista: TStringList; AIndex: Integer
  Result:    Double
-----------------------------------------------------------------------------}

function TPerceptron.RecuperarValor(ALista: TStringList;
  AIndex: Integer): Double;
var
  LResult: Double;
begin
  LResult := -1;
  { checa se o item est� na lista }
  if ((AIndex < ALista.Count) and (AIndex >= 0)) then
  begin
    LResult := StrToFloat(ALista[AIndex]);
  end;
  Result := LResult;
end;

{-----------------------------------------------------------------------------
  Procedure: TPerceptron.RecuperarSaidaAtivada
  Author:    Vin�cius
  Date:      27-nov-2003
  Arguments: None
  Result:    None
-----------------------------------------------------------------------------}

procedure TPerceptron.RecuperarSaidaAtivada;
var
  LResult: Integer;
begin
  LResult := -1;
  if FSaidaIntermediaria >= 0 then
  begin
    LResult := 1;
  end;
  FSaida := LResult;
end;

{-----------------------------------------------------------------------------
  Procedure: TPerceptron.SetAjusteFino
  Author:    Vin�cius
  Date:      30-nov-2003
  Arguments: const Value: Double
  Result:    None
-----------------------------------------------------------------------------}

procedure TPerceptron.SetAjusteFino(const Value: Double);
begin
  FAjusteFino := Value;
end;

{-----------------------------------------------------------------------------
  Procedure: TPerceptron.SetEntradas
  Author:    Vin�cius
  Date:      27-nov-2003
  Arguments: AIndex: Integer; const Value: Double
  Result:    None
-----------------------------------------------------------------------------}

procedure TPerceptron.SetEntradas(AIndex: Integer; const Value: Double);
begin
  Self.InserirValor(FEntradas, AIndex, Value);
end;

{-----------------------------------------------------------------------------
  Procedure: TPerceptron.SetPesos
  Author:    Vin�cius
  Date:      27-nov-2003
  Arguments: AIndex: Integer; const Value: Double
  Result:    None
-----------------------------------------------------------------------------}

procedure TPerceptron.SetPesos(AIndex: Integer; const Value: Double);
begin
  Self.InserirValor(FPesos, AIndex, Value);
end;

{-----------------------------------------------------------------------------
  Procedure: TPerceptron.Somar
  Author:    Vin�cius
  Date:      27-nov-2003
  Arguments: None
  Result:    None
-----------------------------------------------------------------------------}

procedure TPerceptron.Somar;
var
  LCont: Integer;
begin
  { inicia com o ajuste fino }
  FSaidaIntermediaria := FAjusteFino;
  { checa a quantidade de pesos e entradas }
  if FPesos.Count <> FEntradas.Count then
  begin
    raise Exception.Create(SuPerceptron_AQuantidadeDePesosNaoeIgualADeEn);
  end;
  { faz a soma }
  for LCont := 0 to FEntradas.Count - 1 do
  begin
    FSaidaIntermediaria := FSaidaIntermediaria + Self.Pesos[LCont] *
      Self.Entradas[LCont];
  end;
end;

end.

