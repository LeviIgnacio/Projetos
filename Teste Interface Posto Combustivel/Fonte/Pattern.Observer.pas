unit Pattern.Observer;

interface

type
  { Observer }
  IObserver = interface

    // Método que será chamado pelo Subject
    procedure Atualizar;
  end;

implementation

end.
