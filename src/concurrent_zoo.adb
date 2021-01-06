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

   type ABuf is array (Integer range<>) of Integer;
   type Msg is array (Integer range<>) of Unbounded_String;
   type Dlx is array (Integer range<>) of Duration;
   type Dly is array (1..7) of Duration;
   type Tuple is array (1..2) of Integer;

   Window  : Gtk_Window;
   Box     : Gtk_VBox;
   Box1H1   : Gtk_Hbox;
   Box1H2   : Gtk_Hbox;
   Box2H1   : Gtk_Hbox;
   Box2H2   : Gtk_Hbox;

   FoxLabel   : Gtk_Label;
   FoxView    : Gtk_Text_View;
   FoxScroll  : Gtk_Scrolled_Window;
   FoxCounter : Integer;

   KasaLabel  : Gtk_Label;
   KasaView    : Gtk_Text_View;
   KasaScroll  : Gtk_Scrolled_Window;
   KasaCounter : Integer;

   ZooLabel   : Gtk_Label;
   ZooView    : Gtk_Text_View;
   ZooScroll  : Gtk_Scrolled_Window;
   ZooCounter : Integer;

   PandyLabel  : Gtk_Label;
   PandyView    : Gtk_Text_View;
   PandyScroll  : Gtk_Scrolled_Window;
   PandyCounter : Integer;

   KarmienieLabel  : Gtk_Label;
   KarmienieView    : Gtk_Text_View;
   KarmienieScroll  : Gtk_Scrolled_Window;
   KarmienieCounter : Integer;

   SpanieLabel  : Gtk_Label;
   SpanieView    : Gtk_Text_View;
   SpanieScroll  : Gtk_Scrolled_Window;
   SpanieCounter : Integer;

   WybiegLabel  : Gtk_Label;
   WybiegView    : Gtk_Text_View;
   WybiegScroll  : Gtk_Scrolled_Window;
   WybiegCounter : Integer;

   TimeLabel : Gtk_Label;
   StartTime : Time := Clock;

   type Local_Callback is access procedure;
   function "+" is
     new Ada.Unchecked_Conversion (Local_Callback, Gtk_Callback);

   protected type Buf(I: Integer; N: Integer) is
      entry Wstaw(C : in Integer; Tmp : out Integer);
      entry Pobierz(C : out Integer; Tmp : out Integer);
   private
      Text : Msg(1..7) := (
                           To_Unbounded_String("Wchodzi do zoo: "),
                           To_Unbounded_String("Przy kasie: "),
                           To_Unbounded_String("Pandy: "),
                           To_Unbounded_String("Lisy: "),
                           To_Unbounded_String("Spanie: "),
                           To_Unbounded_String("Karmienie: "),
                           To_Unbounded_String("Wybieg: "));
      Delayy : Dly := (0.5, 2.0, 5.0, 8.0, 0.2, 0.2, 0.2);
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

   BZoo: Buf(1, 20);
   BKasa: Buf(2, 3);
   BPandy: Buf(3, 5);
   BLisy: Buf(4, 5);

   BSpanie: Buf(5, 5);
   BKarmienie: Buf(6, 5);
   BWybieg: Buf(7, 20);

   package Messages is new Generic_Message (Tuple);

   procedure HandlerPeople (Data : in out Tuple) is
      Buffer : Gtk_Text_Buffer;
      End_Of : Gtk_Text_Iter;
      ScrollText : Msg(1..8) := (
                               To_Unbounded_String("Wbijam do zoo -> "),
                               To_Unbounded_String("Wbijam do kasy -> "),
                               To_Unbounded_String("Wbijam do lisow -> "),
                               To_Unbounded_String("Wbijam do pand -> "),
                               To_Unbounded_String("Wychodze z ZOO od lisow -> "),
                               To_Unbounded_String("Wychodze z ZOO od pand -> "),
                               To_Unbounded_String("Przyszedlem od pand do lisow -> "),
                               To_Unbounded_String("Przyszedlem od lisow do pand -> ")
                              );
   begin
      if Data(2) = 1 then -- wejscie do zoo
         Buffer := ZooView.Get_Buffer;
      elsif Data(2) = 2 then -- wejscie do kasy
         Buffer := KasaView.Get_Buffer;
      elsif Data(2) = 3 then -- wejscie do lisow z kasy
         Buffer := FoxView.Get_Buffer;
      elsif Data(2) = 4 then -- wejscie do pand z kasy
         Buffer := PandyView.Get_Buffer;
      elsif Data(2) = 5 then -- wyjscie z zoo od lisow
         Buffer := ZooView.Get_Buffer;
      elsif Data(2) = 6 then -- wyjscie z zoo od pand
         Buffer := ZooView.Get_Buffer;
      elsif Data(2) = 7 then -- przejscie z pand do lisow
         Buffer := FoxView.Get_Buffer;
      elsif Data(2) = 8 then -- przejscie z lisow do pand
         Buffer := PandyView.Get_Buffer;
      end if;
      Buffer.Get_End_Iter (End_Of);
      Buffer.Insert
        (  End_Of,
           (  Ada.Strings.Unbounded.To_String(ScrollText(Data(2)))
            &  Integer'Image (Data(1))
            &  Character'Val (10)
           )  );
   end HandlerPeople;

   procedure HandlerAnimals (Data : in out Tuple) is
      Buffer : Gtk_Text_Buffer;
      End_Of : Gtk_Text_Iter;
      ScrollText : Msg(1..3) := (
                               To_Unbounded_String("Jestem na wybiegu -> "),
                               To_Unbounded_String("Spie -> "),
                               To_Unbounded_String("Jem -> ")
                              );
   begin
      if Data(2) = 2 then -- spanie
         Buffer := SpanieView.Get_Buffer;
      elsif Data(2) = 3 then -- karmienie
         Buffer := KarmienieView.Get_Buffer;
      elsif Data(2) = 1 then -- wybieg
         Buffer := WybiegView.Get_Buffer;
      end if;
      Buffer.Get_End_Iter (End_Of);
      Buffer.Insert
        (  End_Of,
           (  Ada.Strings.Unbounded.To_String(ScrollText(Data(2)))
            &  Integer'Image (Data(1))
            &  Character'Val (10)
           )  );
   end HandlerAnimals;

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

   task type ScrollTaskPeople (Id : Integer);

   task body ScrollTaskPeople is
      K: Integer := 0;
      T: Tuple;
   begin
      if Id = 1 then -- wejscie do zoo
            for K in 1..50 loop
               Put_Line("Wbijam do zoo -> " & K'Img);
               T := (K, 1);
               BZoo.Wstaw(K, ZooCounter);
               Messages.Send (HandlerPeople'Access, T);
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
               Messages.Send (HandlerPeople'Access, T);
               BKasa.Wstaw(K, KasaCounter);
               Request (+KasaUpdate'Access);
            end if;
         elsif Id = 3 then -- wejscie do lisow z kasy
            BKasa.Pobierz(K, KasaCounter);
            if K /= 0 then
               Request (+KasaUpdate'Access);
               T := (K, 3);
               Put_Line("Wbijam do lisow -> " & K'Img);
               Messages.Send (HandlerPeople'Access, T);
               BLisy.Wstaw(K, FoxCounter);
               Request (+FoxUpdate'Access);
            end if;
         elsif Id = 4 then -- wejscie do pand z kasy
            BKasa.Pobierz(K, KasaCounter);
            if K /= 0 then
               Request (+KasaUpdate'Access);
               T := (K, 4);
               Put_Line("Wbijam do pand -> " & K'Img);
               Messages.Send (HandlerPeople'Access, T);
               BPandy.Wstaw(K, PandyCounter);
               Request (+PandyUpdate'Access);
            end if;
         elsif Id = 5 then -- wyjscie z zoo od lisow
            BLisy.Pobierz(K, FoxCounter);
            if K /= 0 then
               T := (K, 5);
               Messages.Send (HandlerPeople'Access, T);
               Request (+FoxUpdate'Access);
               Put_Line("Wyjscie od lisow -> " & K'Img);
            end if;
         elsif Id = 6 then -- wyjscie z zoo od pand
            BPandy.Pobierz(K, PandyCounter);
            if K /= 0 then
               T := (K, 6);
               Messages.Send (HandlerPeople'Access, T);
               Request (+PandyUpdate'Access);
               Put_Line("Wyjscie od pand -> " & K'Img);
            end if;
         elsif Id = 7 then -- przejscie z pand do lisow
            BPandy.Pobierz(K, PandyCounter);
            if K /= 0 then
               Request (+PandyUpdate'Access);
               T := (K, 7);
               Messages.Send (HandlerPeople'Access, T);
               Put_Line("Wyjscie od pand do lisow -> " & K'Img);
               BLisy.Wstaw(K, FoxCounter);
               Request (+FoxUpdate'Access);
            end if;
         elsif Id = 8 then -- przejscie z lisow do pand
            BLisy.Pobierz(K, FoxCounter);
            if K /= 0 then
               Request (+FoxUpdate'Access);
               T := (K, 8);
               Messages.Send (HandlerPeople'Access, T);
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
   end ScrollTaskPeople;

   procedure SpanieUpdate is
   begin
      SpanieLabel.Set_Text ("Spanie: " & Integer'Image (SpanieCounter) & "/5");
   end SpanieUpdate;

   procedure KarmienieUpdate is
   begin
      KarmienieLabel.Set_Text ("Karmienie: " & Integer'Image (KarmienieCounter) & "/5");
   end KarmienieUpdate;

   procedure WybiegUpdate is
   begin
      WybiegLabel.Set_Text ("Wybieg: " & Integer'Image (WybiegCounter) & "/20");
   end WybiegUpdate;

   task type ScrollTaskAnimals (Id : Integer);

   task body ScrollTaskAnimals is
      K: Integer := 0;
      T: Tuple;
   begin
      if Id = 1 then -- wejscie na wybieg
            for K in 1..50 loop
               Put_Line("Wbijam na wybieg -> " & K'Img);
               T := (K, 1);
               BWybieg.Wstaw(K, WybiegCounter);
               Messages.Send (HandlerAnimals'Access, T);
               Request (+WybiegUpdate'Access);
            end loop;
      end if;
      loop
         if Id = 2 then -- spanie
            BWybieg.Pobierz(K, WybiegCounter);
            if K /= 0 then
               Request (+WybiegUpdate'Access);
               T := (K, 2);
               Messages.Send (HandlerAnimals'Access, T);
               BSpanie.Wstaw(K, SpanieCounter);
               Request (+SpanieUpdate'Access);
            end if;
         elsif Id = 3 then -- karmienie
            BWybieg.Pobierz(K, WybiegCounter);
            if K /= 0 then
               Request (+WybiegUpdate'Access);
               T := (K, 3);
               Messages.Send (HandlerAnimals'Access, T);
               BKarmienie.Wstaw(K, KarmienieCounter);
               Request (+KarmienieUpdate'Access);
            end if;
         end if;
      end loop;
   exception
      when Quit_Error => -- Main loop was quitted, we follow
         null;
      when Error : others =>
         Say (Exception_Information (Error)); -- This is safe
   end ScrollTaskAnimals;

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
   Window.Add (Box);

   Box1H1 := Gtk_Hbox_New;
   Box1H2 := Gtk_Hbox_New;
   Box2H1 := Gtk_Hbox_New;
   Box2H2 := Gtk_Hbox_New;

   Box.Pack_Start(Child => Box1H1, Expand => False, Fill => False);
   Box.Pack_Start(Child => Box1H2, Expand => True, Fill => True);
   Box.Pack_Start(Child => Box2H1, Expand => False, Fill => False);
   Box.Pack_Start(Child => Box2H2, Expand => True, Fill => True);

   Gtk_New (FoxLabel, "Lisy: 0/5");
   Gtk_New (FoxView);
   Gtk_New (FoxScroll);
   FoxScroll.Add (FoxView);

   Gtk_New (PandyLabel, "Pandy: 0/5");
   Gtk_New (PandyView);
   Gtk_New (PandyScroll);
   PandyScroll.Add (PandyView);

   Gtk_New (ZooLabel, "Zoo: 0/20");
   Gtk_New (ZooView);
   Gtk_New (ZooScroll);
   ZooScroll.Add (ZooView);

   Gtk_New (KasaLabel, "Kasa: 0/3");
   Gtk_New (KasaView);
   Gtk_New (KasaScroll);
   KasaScroll.Add (KasaView);

   Box1H1.Pack_Start (Child => FoxLabel, Expand => True, Fill => False);
   Box1H1.Pack_Start (Child => PandyLabel, Expand => True, Fill => False);
   Box1H1.Pack_Start (Child => ZooLabel, Expand => True, Fill => False);
   Box1H1.Pack_Start (Child => KasaLabel, Expand => True, Fill => False);

   Box1H2.Pack_Start (Child => FoxScroll, Expand => True, Fill => True);
   Box1H2.Pack_Start (Child => PandyScroll, Expand => True, Fill => True);
   Box1H2.Pack_Start (Child => ZooScroll, Expand => True, Fill => True);
   Box1H2.Pack_Start (Child => KasaScroll, Expand => True, Fill => True);

   Gtk_New (SpanieLabel, "Spanie: 0/5");
   Gtk_New (SpanieView);
   Gtk_New (SpanieScroll);
   SpanieScroll.Add (SpanieView);

   Gtk_New (KarmienieLabel, "Karmienie: 0/5");
   Gtk_New (KarmienieView);
   Gtk_New (KarmienieScroll);
   KarmienieScroll.Add (KarmienieView);

   Gtk_New (WybiegLabel, "Wybieg: 0/20");
   Gtk_New (WybiegView);
   Gtk_New (WybiegScroll);
   WybiegScroll.Add (WybiegView);

   --Gtk_New (CzasLabel, "Czas: 00:00");

   Box2H1.Pack_Start (Child => KarmienieLabel, Expand => True, Fill => False);
   Box2H1.Pack_Start (Child => SpanieLabel, Expand => True, Fill => False);
   Box2H1.Pack_Start (Child => WybiegLabel, Expand => True, Fill => False);

   Box2H2.Pack_Start (Child => KarmienieScroll, Expand => True, Fill => True);
   Box2H2.Pack_Start (Child => SpanieScroll, Expand => True, Fill => True);
   Box2H2.Pack_Start (Child => WybiegScroll, Expand => True, Fill => True);

   Box.Show_All;
   Window.Show;

   declare
      Zoo : ScrollTaskPeople(1);
      Kasa : ScrollTaskPeople(2);
      Lisy : ScrollTaskPeople(3);
      Pandy2Lisyy2Lisyy : ScrollTaskPeople(4);
      WyjscieLisy : ScrollTaskPeople(5);
      WyjsciePandy : ScrollTaskPeople(6);
      Pandy2Lisy : ScrollTaskPeople(7);
      Lisysy2Pandy : ScrollTaskPeople(8);

      Wybieg : ScrollTaskAnimals(1);
      Spanie : ScrollTaskAnimals(2);
      Karmienie : ScrollTaskAnimals(3);
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
