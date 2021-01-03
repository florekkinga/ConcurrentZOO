with Ada.Exceptions;       use Ada.Exceptions;
with Gtk.Box;              use Gtk.Box;
with Gdk.Event;            use Gdk.Event;
with Gtk.Label;            use Gtk.Label;
with Gtk.Main.Router;      use Gtk.Main.Router;
with Gtk.Scrolled_Window;  use Gtk.Scrolled_Window;
with Gtk.Text_Buffer;      use Gtk.Text_Buffer;
with Gtk.Text_Iter;        use Gtk.Text_Iter;
with Gtk.Text_View;        use Gtk.Text_View;
with Gtk.Window;           use Gtk.Window;
with Gtk.Widget;           use Gtk.Widget;
with Gtk.Table;       use Gtk.Table;

with Ada.Unchecked_Conversion;
with Ada.Text_IO;     use Ada.Text_IO;
with Gtk.Missed;
with Gtk.Main;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;

procedure Concurrent_Zoo is

   Window  : Gtk_Window;
   Box     : Gtk_VBox;
   BoxH1   : Gtk_Hbox;
   BoxH2   : Gtk_Hbox;
   FoxLabel   : Gtk_Label;
   KasaLabel  : Gtk_Label;
   ZooLabel   : Gtk_Label;
   PandyLabel  : Gtk_Label;
   PandyView    : Gtk_Text_View;
   PandyScroll  : Gtk_Scrolled_Window;
   FoxView    : Gtk_Text_View;
   FoxScroll  : Gtk_Scrolled_Window;
   ZooView    : Gtk_Text_View;
   ZooScroll  : Gtk_Scrolled_Window;
   KasaView    : Gtk_Text_View;
   KasaScroll  : Gtk_Scrolled_Window;
   FoxCounter : Integer;
   PandyCounter : Integer;

   type Local_Callback is access procedure;
   function "+" is
      new Ada.Unchecked_Conversion (Local_Callback, Gtk_Callback);

   type ABuf is array (Integer range<>) of Integer;
   type Msg is array (1..4) of Unbounded_String;
   type Dly is array (1..4) of Duration;

   protected type Buf(I: Integer; N: Integer) is
      entry Wstaw(C : in Integer; Tmp : out Integer);
      entry Pobierz(C : out Integer);
   private
      Text : Msg := (To_Unbounded_String("Wchodzi do zoo: "), To_Unbounded_String("Przy kasie: "), To_Unbounded_String("Pandy: "), To_Unbounded_String("Lisy: "));
      -- Delayy : Dly := (1, 2, 3, 4);
      B : ABuf(1..N);
      Counter : Integer := 0;
   end Buf;

   protected body Buf is
      entry Wstaw(C : in Integer; Tmp : out Integer) when Counter < N is
      begin
         delay 0.1;
         Counter := Counter + 1;
         B (Counter) := C;
         Put_Line(Text(I) & Counter 'Img);
         Tmp := Counter;
      end Wstaw;

      entry Pobierz(C : out Integer) when Counter > 0 is
      begin
         C := B (Counter);
         if I = 1 then
            delay 0.1;
         elsif I = 2 then
            delay 0.1;
         elsif I = 3 then
            delay 5.0;
         elsif I = 4 then
            delay 8.0;
         end if;
         Counter := Counter - 1;
      end Pobierz;
   end Buf;

   package Messages is new Generic_Message (Integer);

   procedure FoxHandler (Data : in out Integer) is
      Buffer : constant Gtk_Text_Buffer := FoxView.Get_Buffer;
      End_Of : Gtk_Text_Iter;
   begin
      Buffer.Get_End_Iter (End_Of);
      Buffer.Insert
      (  End_Of,
         (  "Wbijam do lisow -> "
         &  Integer'Image (Data)
         &  Character'Val (10)
      )  );
   end FoxHandler;

   procedure PandyHandler (Data : in out Integer) is
      Buffer : constant Gtk_Text_Buffer := PandyView.Get_Buffer;
      End_Of : Gtk_Text_Iter;
   begin
      Buffer.Get_End_Iter (End_Of);
      Buffer.Insert
      (  End_Of,
         (  "Wbijam do pand -> "
         &  Integer'Image (Data)
         &  Character'Val (10)
      )  );
   end PandyHandler;

   BZoo: Buf(1, 20);
   BKasa: Buf(2, 3);
   BPandy: Buf(3, 5);
   BLisy: Buf(4, 5);

   task Zoo;
   task Kasa;
   task WyjscieP;
   task wyjscieL;
   task Pandy2Lisy;
   task Lisy2Pandy;

   task body Zoo is
      Tmp : Integer;
   begin
      for K in 1..50 loop
         Put_Line("Wbijam do zoo -> " & K'Img);
         BZoo.Wstaw(K, Tmp);
      end loop;
   end Zoo;

   task body Kasa is
      K: Integer := 0;
   begin
      loop
         BZoo.Pobierz(K);
         Put_Line("Wbijam do kasy -> " & K'Img);
         BKasa.Wstaw(K, K);
      end loop;
   end Kasa;

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
         BLisy.Wstaw(K, K);
      end loop;
   end Pandy2Lisy;

   task body Lisy2Pandy is
      K: Integer := 0;
   begin
      loop
         BLisy.Pobierz(K);
         Put_Line("Wyjscie od lisow do pand -> " & K'Img);
         BPandy.Wstaw(K, K);
      end loop;
   end Lisy2Pandy;

   procedure FoxUpdate is
   begin
         FoxLabel.Set_Text ("Lisy: " & Integer'Image (FoxCounter));
   end FoxUpdate;

   procedure PandyUpdate is
   begin
         PandyLabel.Set_Text ("Pandy: " & Integer'Image (PandyCounter));
   end PandyUpdate;

   task type ScrollTask (Id : Integer);

   task body ScrollTask is
      K: Integer := 0;
   begin
      loop
         if Id = 1 then -- FOX
            BKasa.Pobierz(K);
            Put_Line("Wbijam do lisow -> " & K'Img);
            Messages.Send (FoxHandler'Access, K);
            BLisy.Wstaw(K, FoxCounter);
            Request (+FoxUpdate'Access);
         elsif Id = 2 then -- PANDA
            BKasa.Pobierz(K);
            Put_Line("Wbijam do pand -> " & K'Img);
            Messages.Send (PandyHandler'Access, K);
            BPandy.Wstaw(K, PandyCounter);
            Request (+PandyUpdate'Access);
         end if;
      end loop;
   exception
      when Quit_Error => -- Main loop was quitted, we follow
         null;
      when Error : others =>
         Say (Exception_Information (Error)); -- This is safe
   end ScrollTask;

begin
   Gtk.Main.Init;
   Gtk_New (Window);
   Gtk.Main.Router.Init (Window); -- This must be called once

   Window.Set_Title ("Concurrent ZOO");
   Window.Set_Default_Size (800, 800);
   Window.On_Delete_Event (Gtk.Missed.Delete_Event_Handler'Access);
   Window.On_Destroy (Gtk.Missed.Destroy_Handler'Access);

   Box := Gtk_VBox_New;
   BoxH1 := Gtk_Hbox_New;
   BoxH2 := Gtk_Hbox_New;
   Window.Add (Box);
   Box.Pack_Start(Child => BoxH1, Expand => False, Fill => False);
   Box.Pack_Start(Child => BoxH2, Expand => True, Fill => True);

   Gtk_New (FoxLabel, "Fox: 0");
   Gtk_New (PandyLabel, "Pandy: 0");
   Gtk_New (ZooLabel, "Zoo: 0");
   Gtk_New (KasaLabel, "Kasa: 0");
   BoxH1.Pack_Start (Child => FoxLabel, Expand => True, Fill => False);
   BoxH1.Pack_Start (Child => PandyLabel, Expand => True, Fill => False);
   BoxH1.Pack_Start (Child => ZooLabel, Expand => True, Fill => False);
   BoxH1.Pack_Start (Child => KasaLabel, Expand => True, Fill => False);

   Gtk_New (FoxView);
   Gtk_New (FoxScroll);
   FoxScroll.Add (FoxView);

   Gtk_New (PandyView);
   Gtk_New (PandyScroll);
   PandyScroll.Add (PandyView);

   Gtk_New (KasaView);
   Gtk_New (KasaScroll);
   KasaScroll.Add (KasaView);

   Gtk_New (ZooView);
   Gtk_New (ZooScroll);
   ZooScroll.Add (ZooView);

   BoxH2.Pack_Start (Child => FoxScroll, Expand => True, Fill => True);
   BoxH2.Pack_Start (Child => PandyScroll, Expand => True, Fill => True);
   BoxH2.Pack_Start (Child => KasaScroll, Expand => True, Fill => True);
   BoxH2.Pack_Start (Child => ZooScroll, Expand => True, Fill => True);

   Box.Show_All;
   Window.Show;
   declare
      Lisy : ScrollTask(1);
      Pandy : ScrollTask(2);
   begin
      -- Enter the events processing loop
      Gtk.Main.Main;
   end;
exception
   when Error : others =>
      Say (Exception_Information (Error));
end Concurrent_Zoo;
