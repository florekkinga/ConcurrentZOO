with Gdk.Event;       use Gdk.Event;

with Gtk.Box;         use Gtk.Box;
with Gtk.Label;       use Gtk.Label;
with Gtk.Widget;      use Gtk.Widget;
with Gtk.Main;
with Gtk.Window;      use Gtk.Window;

with Ada.Text_IO;     use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;

procedure Projekt is

   Win   : Gtk_Window;
   Label : Gtk_Label;
   Box   : Gtk_Vbox;

   function Delete_Event_Cb
     (Self  : access Gtk_Widget_Record'Class;
      Event : Gdk.Event.Gdk_Event)
      return Boolean;

   ---------------------
   -- Delete_Event_Cb --
   ---------------------

   function Delete_Event_Cb
     (Self  : access Gtk_Widget_Record'Class;
      Event : Gdk.Event.Gdk_Event)
      return Boolean
   is
      pragma Unreferenced (Self, Event);
   begin
      Gtk.Main.Main_Quit;
      return True;
   end Delete_Event_Cb;

   type ABuf is array (Integer range<>) of Integer;
   type Msg is array (1..4) of Unbounded_String;
   type Dly is array (1..4) of Duration;

   protected type Buf(I: Integer; N: Integer) is
      entry Wstaw(C : Integer);
      entry Pobierz(C : out Integer);
   private
      Text : Msg := (To_Unbounded_String("Wchodzi do zoo: "), To_Unbounded_String("Przy kasie: "), To_Unbounded_String("Pandy: "), To_Unbounded_String("Lisy: "));
      Delayy : Dly := (0.0, 0.0, 10.0, 12.0);
      B : ABuf(1..N);
      Counter : Integer := 0;
   end Buf;

   protected body Buf is
      entry Wstaw(C : Integer) when Counter < N is
      begin
         Counter := Counter + 1;
         B (Counter) := C;
         Put_Line(Text(I) & Counter 'Img);

      end Wstaw;

      entry Pobierz(C : out Integer) when Counter > 0 is
      begin
         C := B (Counter);
         delay Delayy(I);
         Counter := Counter - 1;
         --Put_Line(Text(I) & Counter 'Img);
      end Pobierz;
   end Buf;

   BZoo: Buf(1, 20);
   BKasa: Buf(2, 3);
   BPandy: Buf(3, 5);
   BLisy: Buf(4, 5);

   task Zoo;
   task Kasa;
   task Pandy;
   task Lisy;
   task WyjscieP;
   task wyjscieL;
   task Pandy2Lisy;
   task Lisy2Pandy;

   task body Zoo is
   begin
      for K in 1..50 loop
         Put_Line("Wbijam do zoo -> " & K'Img);
         BZoo.Wstaw(K);
      end loop;
   end Zoo;

   task body Kasa is
      K: Integer := 0;
   begin
      loop
         BZoo.Pobierz(K);
         Put_Line("Wbijam do kasy -> " & K'Img);
         BKasa.Wstaw(K);
      end loop;
   end Kasa;

   task body Pandy is
      K: Integer := 0;
   begin
      loop
         BKasa.Pobierz(K);
         Put_Line("Wbijam do pand -> " & K'Img);
         BPandy.Wstaw(K);
      end loop;
   end Pandy;

   task body Lisy is
      K: Integer := 0;
   begin
      loop
         BKasa.Pobierz(K);
         Put_Line("Wbijam do lisow -> " & K'Img);
         BLisy.Wstaw(K);
      end loop;
   end Lisy;

   task body WyjscieP is
      K: Integer := 0;
   begin
      loop
         BPandy.Pobierz(K);
         Put_Line("Wyjscie od pand -> " & K'Img);
      end loop;
   end wyjscieP;

   task body WyjscieL is
      K: Integer := 0;
   begin
      loop
         BLisy.Pobierz(K);
         Put_Line("Wyjscie od lisow -> " & K'Img);
      end loop;
   end wyjscieL;

   task body Pandy2Lisy is
      K: Integer := 0;
   begin
      loop
         BPandy.Pobierz(K);
         Put_Line("Wyjscie od pand do lisow -> " & K'Img);
         BLisy.Wstaw(K);
      end loop;
   end Pandy2Lisy;

   task body Lisy2Pandy is
      K: Integer := 0;
   begin
      loop
         BLisy.Pobierz(K);
         Put_Line("Wyjscie od lisow do pand -> " & K'Img);
         BPandy.Wstaw(K);
      end loop;
   end Lisy2Pandy;

begin
   --  Initialize GtkAda.
   Gtk.Main.Init;

   --  Create a window with a size of 400x400
   Gtk_New (Win);
   Win.Set_Default_Size (400, 400);

   --  Create a box to organize vertically the contents of the window
   Gtk_New_Vbox (Box);
   Win.Add (Box);

   --  Add a label
   Gtk_New (Label, "Hello world.");
   Box.Add (Label);

   -- Stop the Gtk process when closing the window
   Win.On_Delete_Event (Delete_Event_Cb'Unrestricted_Access);

   --  Show the window and present it
   Win.Show_All;
   Win.Present;

   --  Start the Gtk+ main loop
   Gtk.Main.Main;
end Projekt;
