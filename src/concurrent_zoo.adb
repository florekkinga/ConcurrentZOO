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
with Ada.Calendar; use Ada.Calendar;

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
   ZooCounter : Integer;
   KasaCounter : Integer;
   StartTime : Time := Clock;

   type Local_Callback is access procedure;
   function "+" is
     new Ada.Unchecked_Conversion (Local_Callback, Gtk_Callback);

   type ABuf is array (Integer range<>) of Integer;
   type Msg is array (1..4) of Unbounded_String;
   type Dly is array (1..4) of Duration;
   type Dlx is array (Integer range<>) of Duration;
   type Tuple is array (1..2) of Integer;

   protected type Buf(I: Integer; N: Integer) is
      entry Wstaw(C : in Integer; Tmp : out Integer);
      entry Pobierz(C : out Integer; Tmp : out Integer);
   private
      Text : Msg := (To_Unbounded_String("Wchodzi do zoo: "), To_Unbounded_String("Przy kasie: "), To_Unbounded_String("Pandy: "), To_Unbounded_String("Lisy: "));
      Delayy : Dly := (0.5, 2.0, 5.0, 8.0);
      Delayx : Dlx(1..N) := (others => 0.0);
      B : ABuf(1..N)  := (others => 0);
      Counter : Integer := 0;
      Pivot : Integer := 0;
      Pivot2 : Integer := 0;
      --Delayx : Duration := Clock - StartTime;
   end Buf;

   protected body Buf is
      entry Wstaw(C : in Integer; Tmp : out Integer) when Counter < N is
      begin
         -- delay 0.1;
         Counter := Counter + 1;
         Pivot := Pivot + 1;
         B (Pivot) := C;
         Put_Line(Text(I) & Counter 'Img);
         Tmp := Counter;
         Delayx(Pivot) := (Clock - StartTime) + Delayy(I);
         Put_Line(Duration'Image(Clock - StartTime));
         Put_Line(Duration'Image(Delayx(Pivot)));
         if Pivot = N then
            Pivot := 0;
         end if;
      end Wstaw;

      entry Pobierz(C : out Integer; Tmp : out Integer) when Counter > 0 is
         Finished : Boolean := False;
      begin
         C := 0;
         for I in 1..N loop
            if B(I) /= 0 and Delayx(I) <= (Clock - StartTime) then
               --  Put_Line("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA: " & B(I)'Image);
               C := B (I);
               B(I) := 0;
         --  Pivot2 := Pivot2 + 1;
         --  C := B (Pivot2);
         --  if Pivot2 = N then
         --     Pivot2 := 0;
         --  end if;
         --  if I = 1 then
         --     delay 0.1;
         --  elsif I = 2 then
         --     delay 0.1;
         --  elsif I = 3 then
         --     delay 50.0;
         --  elsif I = 4 then
         --     delay 8.0;
         --  end if;
               Counter := Counter - 1;
               Tmp := Counter;
               Finished := True;
            end if;
            exit when Finished;
         end loop;
      end Pobierz;
   end Buf;

   package Messages is new Generic_Message (Tuple);

   procedure Handler (Data : in out Tuple) is
      Buffer : Gtk_Text_Buffer;
      End_Of : Gtk_Text_Iter;
   begin
      if Data(2) = 1 then -- wejscie do zoo
         Buffer := ZooView.Get_Buffer;
         Buffer.Get_End_Iter (End_Of);
         Buffer.Insert
           (  End_Of,
              (  "Wbijam do zoo -> "
               &  Integer'Image (Data(1))
               &  Character'Val (10)
              )  );
      elsif Data(2) = 2 then -- wejscie do kasy
         Buffer := KasaView.Get_Buffer;
         Buffer.Get_End_Iter (End_Of);
         Buffer.Insert
           (  End_Of,
              (  "Wbijam do kasy -> "
               &  Integer'Image (Data(1))
               &  Character'Val (10)
              )  );
      elsif Data(2) = 3 then -- wejscie do lisow z kasy
         Buffer := FoxView.Get_Buffer;
         Buffer.Get_End_Iter (End_Of);
         Buffer.Insert
           (  End_Of,
              (  "Wbijam do lisow -> "
               &  Integer'Image (Data(1))
               &  Character'Val (10)
              )  );
      elsif Data(2) = 4 then -- wejscie do pand z kasy
         Buffer := PandyView.Get_Buffer;
         Buffer.Get_End_Iter (End_Of);
         Buffer.Insert
           (  End_Of,
              (  "Wbijam do pand -> "
               &  Integer'Image (Data(1))
               &  Character'Val (10)
              )  );
      elsif Data(2) = 5 then -- wyjscie z zoo od lisow
         Buffer := ZooView.Get_Buffer;
         Buffer.Get_End_Iter (End_Of);
         Buffer.Insert
           (  End_Of,
              (  "Wychodze z ZOO od lisow -> "
               &  Integer'Image (Data(1))
               &  Character'Val (10)
              )  );
      elsif Data(2) = 6 then -- wyjscie z zoo od pand
         Buffer := ZooView.Get_Buffer;
         Buffer.Get_End_Iter (End_Of);
         Buffer.Insert
           (  End_Of,
              (  "Wychodze z ZOO od pand -> "
               &  Integer'Image (Data(1))
               &  Character'Val (10)
              )  );
      elsif Data(2) = 7 then -- przejscie z pand do lisow
         Buffer := FoxView.Get_Buffer;
         Buffer.Get_End_Iter (End_Of);
         Buffer.Insert
           (  End_Of,
              (  "Przyszedlem od pand do lisow -> "
               &  Integer'Image (Data(1))
               &  Character'Val (10)
              )  );
      elsif Data(2) = 8 then -- przejscie z lisow do pand
         Buffer := PandyView.Get_Buffer;
         Buffer.Get_End_Iter (End_Of);
         Buffer.Insert
           (  End_Of,
              (  "Przyszedlem od lisow do pand -> "
               &  Integer'Image (Data(1))
               &  Character'Val (10)
              )  );
      end if;
   end Handler;

   BZoo: Buf(1, 20);
   BKasa: Buf(2, 3);
   BPandy: Buf(3, 5);
   BLisy: Buf(4, 5);

   procedure FoxUpdate is
   begin
      FoxLabel.Set_Text ("Lisy: " & Integer'Image (FoxCounter) & "/5");
   end FoxUpdate;

   procedure PandyUpdate is
   begin
      PandyLabel.Set_Text ("Pandy: " & Integer'Image (PandyCounter) & "/5");
   end PandyUpdate;

   procedure ZooUpdate is
   begin
      ZooLabel.Set_Text ("Zoo: " & Integer'Image (ZooCounter) & "/20");
   end ZooUpdate;

   procedure KasaUpdate is
   begin
      KasaLabel.Set_Text ("Kasa: " & Integer'Image (KasaCounter) & "/3");
   end KasaUpdate;

   task type ScrollTask (Id : Integer);

   task body ScrollTask is
      K: Integer := 0;
      T: Tuple;
   begin
      if Id = 1 then -- wejscie do zoo
            for K in 1..50 loop
               Put_Line("Wbijam do zoo -> " & K'Img);
               T := (K, 1);
               BZoo.Wstaw(K, ZooCounter);
               Messages.Send (Handler'Access, T);
               Request (+ZooUpdate'Access);
            end loop;
      end if;
      loop
         if Id = 2 then -- wejscie do kasy
            BZoo.Pobierz(K, ZooCounter);
            if K /= 0 then
               Request (+ZooUpdate'Access);
               T := (K, 2);
               Put_Line("Wbijam do kasy -> " & K'Img);
               Messages.Send (Handler'Access, T);
               BKasa.Wstaw(K, KasaCounter);
               Request (+KasaUpdate'Access);
            end if;
         elsif Id = 3 then -- wejscie do lisow z kasy
            BKasa.Pobierz(K, KasaCounter);
            if K /= 0 then
               Request (+KasaUpdate'Access);
               T := (K, 3);
               Put_Line("Wbijam do lisow -> " & K'Img);
               Messages.Send (Handler'Access, T);
               BLisy.Wstaw(K, FoxCounter);
               Request (+FoxUpdate'Access);
            end if;
         elsif Id = 4 then -- wejscie do pand z kasy
            BKasa.Pobierz(K, KasaCounter);
            if K /= 0 then
               Request (+KasaUpdate'Access);
               T := (K, 4);
               Put_Line("Wbijam do pand -> " & K'Img);
               Messages.Send (Handler'Access, T);
               BPandy.Wstaw(K, PandyCounter);
               Request (+PandyUpdate'Access);
            end if;
         elsif Id = 5 then -- wyjscie z zoo od lisow
            BLisy.Pobierz(K, FoxCounter);
            if K /= 0 then
               T := (K, 5);
               Messages.Send (Handler'Access, T);
               Request (+FoxUpdate'Access);
               Put_Line("Wyjscie od lisow -> " & K'Img);
            end if;
         elsif Id = 6 then -- wyjscie z zoo od pand
            BPandy.Pobierz(K, PandyCounter);
            if K /= 0 then
               T := (K, 6);
               Messages.Send (Handler'Access, T);
               Request (+PandyUpdate'Access);
               Put_Line("Wyjscie od pand -> " & K'Img);
            end if;
         elsif Id = 7 then -- przejscie z pand do lisow
            BPandy.Pobierz(K, PandyCounter);
            if K /= 0 then
               Request (+PandyUpdate'Access);
               T := (K, 7);
               Messages.Send (Handler'Access, T);
               Put_Line("Wyjscie od pand do lisow -> " & K'Img);
               BLisy.Wstaw(K, FoxCounter);
               Request (+FoxUpdate'Access);
            end if;
         elsif Id = 8 then -- przejscie z lisow do pand
            BLisy.Pobierz(K, FoxCounter);
            if K /= 0 then
               Request (+FoxUpdate'Access);
               T := (K, 8);
               Messages.Send (Handler'Access, T);
               Put_Line("Wyjscie od lisow do pand -> " & K'Img);
               BPandy.Wstaw(K, PandyCounter);
               Request (+PandyUpdate'Access);
            end if;
         end if;
         delay 0.1;
      end loop;
   exception
      when Quit_Error => -- Main loop was quitted, we follow
         null;
      when Error : others =>
         Say (Exception_Information (Error)); -- This is safe
   end ScrollTask;

   procedure Cos is
   begin
      Put_Line("Cos");
      delay 3.0;
   end Cos;

begin
   Gtk.Main.Init;
   Gtk_New (Window);
   Gtk.Main.Router.Init (Window); -- This must be called once

   Window.Set_Title ("Concurrent ZOO");
   Window.Set_Default_Size (1000, 800);
   Window.On_Delete_Event (Gtk.Missed.Delete_Event_Handler'Access);
   Window.On_Destroy (Gtk.Missed.Destroy_Handler'Access);

   Box := Gtk_VBox_New;
   BoxH1 := Gtk_Hbox_New;
   BoxH2 := Gtk_Hbox_New;
   Window.Add (Box);
   Box.Pack_Start(Child => BoxH1, Expand => False, Fill => False);
   Box.Pack_Start(Child => BoxH2, Expand => True, Fill => True);

   Gtk_New (FoxLabel, "Fox: 0/5");
   Gtk_New (PandyLabel, "Pandy: 0/5");
   Gtk_New (ZooLabel, "Zoo: 0/20");
   Gtk_New (KasaLabel, "Kasa: 0/3");
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
   BoxH2.Pack_Start (Child => ZooScroll, Expand => True, Fill => True);
   BoxH2.Pack_Start (Child => KasaScroll, Expand => True, Fill => True);

   Box.Show_All;
   Window.Show;

   declare
      Zoo : ScrollTask(1);
      Kasa : ScrollTask(2);
      Lisy : ScrollTask(3);
      Pandy2Lisyy2Lisyy : ScrollTask(4);
      WyjscieLisy : ScrollTask(5);
      WyjsciePandy : ScrollTask(6);
      Pandy2Lisy : ScrollTask(7);
      Lisysy2Pandy : ScrollTask(8);
   begin
      --  for I in 1..20 loop
      --     Cos;
      --  end loop;
      --  delay 20.0;
      Gtk.Main.Main;
   end;
exception
   when Error : others =>
      Say (Exception_Information (Error));
end Concurrent_Zoo;
