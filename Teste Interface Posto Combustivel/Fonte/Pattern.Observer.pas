unit Pattern.Observer;

interface

type
  { Observer }
  IObserver = interface

    // M�todo que ser� chamado pelo Subject
    procedure Atualizar;
  end;

implementation

end.
