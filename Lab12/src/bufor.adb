-- Kinga Florek, Micha³ Worsowicz

with Ada.Synchronous_Task_Control;
use Ada.Synchronous_Task_Control;

package body Bufor is

  type Tuple is array (1..2) of Integer;

  Sem_We, Sem_Wy : Suspension_Object;
  Buf: Tuple;

  procedure Wstaw(X : in Integer; Y : in Integer) is
  begin
    Suspend_Until_True(Sem_We);
    Buf(1) := X;
    Buf(2) := Y;
    Set_True(Sem_Wy);
  end Wstaw;

  procedure Pobierz(X : out Integer; Y : out Integer) is
  begin
    Suspend_Until_True(Sem_Wy);
    X := Buf(1);
    Y := Buf(2);
    Set_True(Sem_We);
  end Pobierz;

begin
  Set_True(Sem_We);
  Set_False(Sem_Wy);
end Bufor;
