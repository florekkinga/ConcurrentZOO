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
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with GNAT.OS_Lib; use GNAT.OS_Lib;

-- Aplikacja symuluj±ca dzia³anie ogrodu zoologicznego
procedure Concurrent_Zoo is

   -- deklaracja typów oraz zmiennych
   type ABuf is array (Integer range<>) of Integer;
   type Msg is array (Integer range<>) of Unbounded_String;
   type Dlx is array (Integer range<>) of Duration;
   type Dly is array (1..7) of Duration;
   type Tuple is array (1..2) of Integer;
   type TupleA is array (1..3) of Integer;

   Window  : Gtk_Window;
   Box     : Gtk_VBox;
   Box0    : Gtk_Hbox;
   Box1H1   : Gtk_Hbox;
   Box1H2   : Gtk_Hbox;
   Box2H1   : Gtk_Hbox;
   Box2H2   : Gtk_Hbox;

   ZooLabel   : Gtk_Label;
   ZooCounter : Integer := 0;

   FoxLabel   : Gtk_Label;
   FoxView    : Gtk_Text_View;
   FoxScroll  : Gtk_Scrolled_Window;
   FoxCounter : Integer := 0;

   KasaLabel  : Gtk_Label;
   KasaView    : Gtk_Text_View;
   KasaScroll  : Gtk_Scrolled_Window;
   KasaCounter : Integer := 0;

   WejscieLabel   : Gtk_Label;
   WejscieView    : Gtk_Text_View;
   WejscieScroll  : Gtk_Scrolled_Window;
   WejscieCounter : Integer := 0;

   PandyLabel  : Gtk_Label;
   PandyView    : Gtk_Text_View;
   PandyScroll  : Gtk_Scrolled_Window;
   PandyCounter : Integer := 0;

   KarmienieLabel  : Gtk_Label;
   KarmienieView    : Gtk_Text_View;
   KarmienieScroll  : Gtk_Scrolled_Window;
   KarmienieCounter : Integer := 0;

   SpanieLabel  : Gtk_Label;
   SpanieView    : Gtk_Text_View;
   SpanieScroll  : Gtk_Scrolled_Window;
   SpanieCounter : Integer := 0;

   WybiegLabel  : Gtk_Label;
   WybiegView    : Gtk_Text_View;
   WybiegScroll  : Gtk_Scrolled_Window;
   WybiegCounter : Integer := 0;

   TimeLabel : Gtk_Label;
   TimeCounter : Duration;
   StartTime : Time := Clock;

   -- typ oraz funkcja bêd±ca czê¶ci± GtkAda_Contributions,
   -- konieczne do poprawnego dzia³ania procedur *Upgrade
   type Local_Callback is access procedure;
   function "+" is
     new Ada.Unchecked_Conversion (Local_Callback, Gtk_Callback);

   -- typ bufor, przechowuj±cy ID odwiedzaj±cych/zwierz±t
   protected type Buf(I: Integer; N: Integer) is
      entry Wstaw(C : in Integer; Tmp : in out Integer);
      entry Pobierz(C : out Integer; Tmp : in out Integer);
   private
      Delayy : Dly := (1.0, 2.5, 5.0, 8.0, 6.0, 4.0, 5.0);
      Delayx : Dlx(1..N) := (others => 0.0);
      B : ABuf(1..N)  := (others => 0);
      Counter : Integer := 0;
      Pivot : Integer := 0;
      Pivot2 : Integer := 0;
   end Buf;

   protected body Buf is
      -- procedura wstawiania warto¶ci do bufora
      entry Wstaw(C : in Integer; Tmp : in out Integer) when Counter < N is
      begin
         Counter := Counter + 1;
         Pivot := Pivot + 1;
         B (Pivot) := C;
         Tmp := Counter;
         Delayx(Pivot) := (Clock - StartTime) + Delayy(I);
         if Pivot = N then
            Pivot := 0;
         end if;
      end Wstaw;

      -- procedura pobierania warto¶ci z bufora
      entry Pobierz(C : out Integer; Tmp : in out Integer) when Counter > 0 is
         Finished : Boolean := False;
      begin
         C := 0;
         for I in 1..N loop
            if B(I) /= 0 and Delayx(I) <= (Clock - StartTime) then
               C := B (I);
               B(I) := 0;
               Delayx(I) := 0.0;
               Counter := Counter - 1;
               Tmp := Counter;
               Finished := True;
            end if;
            exit when Finished;
         end loop;
      end Pobierz;
   end Buf;

   -- deklaracja buforów
   BWejscie: Buf(1, 20);
   BKasa: Buf(2, 3);
   BPandy: Buf(3, 5);
   BLisy: Buf(4, 5);

   BSpanie: Buf(5, 5);
   BKarmienie: Buf(6, 5);
   BWybieg: Buf(7, 20);

   -- deklaracja pakietów Generic_Message
   package Messages is new Generic_Message (Tuple);
   package Messages2 is new Generic_Message (TupleA);

   -- procedura zajmuj±ca siê przesy³aniem log'ów odwiedzaj±cych do wy¶wietlenia
   procedure HandlerPeople (Data : in out Tuple) is
      Buffer : Gtk_Text_Buffer;
      End_Of : Gtk_Text_Iter;
      ScrollText : Msg(1..8) := (
                               To_Unbounded_String("Przychodze do zoo -> "),
                               To_Unbounded_String("Przychodze do kasy -> "),
                               To_Unbounded_String("Przychodze do lisow -> "),
                               To_Unbounded_String("Przychodze do pand -> "),
                               To_Unbounded_String("Wychodze z zoo od lisow -> "),
                               To_Unbounded_String("Wychodze z zoo od pand -> "),
                               To_Unbounded_String("Przyszedlem od pand do lisow -> "),
                               To_Unbounded_String("Przyszedlem od lisow do pand -> ")
                              );
   begin
      if Data(2) = 1 then -- wejscie do zoo
         Buffer := WejscieView.Get_Buffer;
      elsif Data(2) = 2 then -- wejscie do kasy
         Buffer := KasaView.Get_Buffer;
      elsif Data(2) = 3 then -- wejscie do lisow z kasy
         Buffer := FoxView.Get_Buffer;
      elsif Data(2) = 4 then -- wejscie do pand z kasy
         Buffer := PandyView.Get_Buffer;
      elsif Data(2) = 5 then -- wyjscie z zoo od lisow
         Buffer := WejscieView.Get_Buffer;
      elsif Data(2) = 6 then -- wyjscie z zoo od pand
         Buffer := WejscieView.Get_Buffer;
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

   -- procedura zajmuj±ca siê przesy³aniem log'ów zwierz±t do wy¶wietlenia
   procedure HandlerAnimals (Data : in out TupleA) is
      Buffer : Gtk_Text_Buffer;
      End_Of : Gtk_Text_Iter;
      ScrollText : Msg(1..5) := (
                               To_Unbounded_String("Jestem na wybiegu -> "),
                               To_Unbounded_String("Spie -> "),
                               To_Unbounded_String("Jem -> "),
                               To_Unbounded_String("Wstalem i ide na wybieg -> "),
                               To_Unbounded_String("Zjadlem i ide na wybieg -> ")
                              );
      Rodzaj : String := "123456789";
   begin
      if Data(3) = 1 then
           Rodzaj := "  (Panda)";
      else
           Rodzaj := "  (Lis)  ";
      end if;
      if Data(2) = 2 then -- spanie
         Buffer := SpanieView.Get_Buffer;
      elsif Data(2) = 3 then -- karmienie
         Buffer := KarmienieView.Get_Buffer;
      elsif Data(2) = 1 then -- wybieg
         Buffer := WybiegView.Get_Buffer;
      elsif Data(2) = 4 then -- ze spania na wybieg
         Buffer := SpanieView.Get_Buffer;
      elsif Data(2) = 5 then -- z karmienia na wybieg
         Buffer := KarmienieView.Get_Buffer;
      end if;
      Buffer.Get_End_Iter (End_Of);
      Buffer.Insert
        (  End_Of,
           (  Ada.Strings.Unbounded.To_String(ScrollText(Data(2)))
            &  Integer'Image (Data(1))
            &  Rodzaj
            &  Character'Val (10)
           )  );
   end HandlerAnimals;

   -- procedura aktualizuj±ca licznik osób w zoo
   procedure ZooUpdate is
   begin
      ZooLabel.Set_Text ("Zoo: " & Integer'Image (ZooCounter) & "/33");
   end ZooUpdate;

   -- procedura aktualizuj±ca licznik czasu
   procedure TimeUpdate is
      Mins     : Integer := (Integer(TimeCounter)/60) mod 60;
      Secs     : Integer := Integer(TimeCounter) mod 60;
      Milisecs : Integer := Integer((TimeCounter - Duration(Integer(TimeCounter)))*100 + 50.0);
      Tmp      : String := "0";
      Tmp2     : String := "000";
      TextSecs : String := "00";
      TextMili : String := "00";
      TextMin  : String := "00";
   begin
      if Mins < 10 then
         TextMin := Integer'Image(Mins);
         Tmp := TextMin(2 .. TextMin'Last);
         TextMin := "0" & Tmp;
      else
         Tmp2 := Integer'Image(Mins);
         TextMin := Tmp2(2 .. Tmp2'Last);
      end if;

      if Secs < 10 then
         TextSecs := Integer'Image(Secs);
         Tmp := TextSecs(2 .. TextSecs'Last);
         TextSecs := "0" & Tmp;
      else
         Tmp2 := Integer'Image(Secs);
         TextSecs := Tmp2(2 .. Tmp2'Last);
      end if;

      if Milisecs < 10 then
         TextMili := Integer'Image(Milisecs);
         Tmp := TextMili(2 .. TextMili'Last);
         TextMili := "0" & Tmp;
      elsif Milisecs = 100 then
         TextMili := "00";
      else
         Tmp2 := Integer'Image(Milisecs);
         TextMili := Tmp2(2 .. Tmp2'Last);
      end if;

      TimeLabel.Set_Text(TextMin & ":" & TextSecs & ":" & TextMili);
   end TimeUpdate;

   -- procedura aktualizuj±ca licznik osób przy lisach
   procedure FoxUpdate is
   begin
      FoxLabel.Set_Text ("Lisy: " & Integer'Image (FoxCounter) & "/5");
   end FoxUpdate;

   -- procedura aktualizuj±ca licznik osób przy pandach
   procedure PandyUpdate is
   begin
      PandyLabel.Set_Text ("Pandy: " & Integer'Image (PandyCounter) & "/5");
   end PandyUpdate;

   -- procedura aktualizuj±ca licznik osób przy wej¶ciu
   procedure WejscieUpdate is
   begin
      WejscieLabel.Set_Text ("Wejscie: " & Integer'Image (WejscieCounter) & "/20");
   end WejscieUpdate;

   -- procedura aktualizuj±ca licznik osób przy kasach
   procedure KasaUpdate is
   begin
      KasaLabel.Set_Text ("Kasa: " & Integer'Image (KasaCounter) & "/3");
   end KasaUpdate;

   -- typ tasków dla czynno¶ci odwiedzaj±cych
   task type ScrollTaskPeople (Id : Integer);

   task body ScrollTaskPeople is
      K: Integer := 0;
      T: Tuple;
   begin
      if Id = 1 then -- wejscie do zoo
            for K in 1..50 loop
               T := (K, 1);
               BWejscie.Wstaw(K, WejscieCounter);
               ZooCounter := ZooCounter + 1;
               Messages.Send (HandlerPeople'Access, T);
               Request (+WejscieUpdate'Access);
               Request (+ZooUpdate'Access);
               delay 1.0;
            end loop;
      end if;
      loop
         if Id = 2 then -- wejscie do kasy
            BWejscie.Pobierz(K, WejscieCounter);
            if K /= 0 then
               Request (+WejscieUpdate'Access);
               T := (K, 2);
               Messages.Send (HandlerPeople'Access, T);
               BKasa.Wstaw(K, KasaCounter);
               Request (+KasaUpdate'Access);
            end if;
         elsif Id = 3 then -- wejscie do lisow z kasy
            BKasa.Pobierz(K, KasaCounter);
            if K /= 0 then
               Request (+KasaUpdate'Access);
               T := (K, 3);
               Messages.Send (HandlerPeople'Access, T);
               BLisy.Wstaw(K, FoxCounter);
               Request (+FoxUpdate'Access);
            end if;
         elsif Id = 4 then -- wejscie do pand z kasy
            BKasa.Pobierz(K, KasaCounter);
            if K /= 0 then
               Request (+KasaUpdate'Access);
               T := (K, 4);
               Messages.Send (HandlerPeople'Access, T);
               BPandy.Wstaw(K, PandyCounter);
               Request (+PandyUpdate'Access);
            end if;
         elsif Id = 5 then -- wyjscie z zoo od lisow
            BLisy.Pobierz(K, FoxCounter);
            if K /= 0 then
               ZooCounter := ZooCounter - 1;
               Request (+ZooUpdate'Access);
               T := (K, 5);
               Messages.Send (HandlerPeople'Access, T);
               Request (+FoxUpdate'Access);
            end if;
         elsif Id = 6 then -- wyjscie z zoo od pand
            BPandy.Pobierz(K, PandyCounter);
            if K /= 0 then
               ZooCounter := ZooCounter - 1;
               Request (+ZooUpdate'Access);
               T := (K, 6);
               Messages.Send (HandlerPeople'Access, T);
               Request (+PandyUpdate'Access);
            end if;
         elsif Id = 7 then -- przejscie z pand do lisow
            BPandy.Pobierz(K, PandyCounter);
            if K /= 0 then
               Request (+PandyUpdate'Access);
               T := (K, 7);
               Messages.Send (HandlerPeople'Access, T);
               BLisy.Wstaw(K, FoxCounter);
               Request (+FoxUpdate'Access);
            end if;
         elsif Id = 8 then -- przejscie z lisow do pand
            BLisy.Pobierz(K, FoxCounter);
            if K /= 0 then
               Request (+FoxUpdate'Access);
               T := (K, 8);
               Messages.Send (HandlerPeople'Access, T);
               BPandy.Wstaw(K, PandyCounter);
               Request (+PandyUpdate'Access);
            end if;
         end if;
         TimeCounter := Clock - StartTime;
         Request (+TimeUpdate'Access);
         delay 0.1;
      end loop;
   exception
      -- W przypadku b³êdu
      when Quit_Error =>
         null;
      when Error : others =>
         Say (Exception_Information (Error));
   end ScrollTaskPeople;

   -- procedura aktualizuj±ca licznik ¶pi±cych zwierz±t
   procedure SpanieUpdate is
   begin
      SpanieLabel.Set_Text ("Spanie: " & Integer'Image (SpanieCounter) & "/5");
   end SpanieUpdate;

   -- procedura aktualizuj±ca licznik jedz±cych zwierz±t
   procedure KarmienieUpdate is
   begin
      KarmienieLabel.Set_Text ("Karmienie: " & Integer'Image (KarmienieCounter) & "/5");
   end KarmienieUpdate;

   -- procedura aktualizuj±ca licznik zwierz±t na wybiegu
   procedure WybiegUpdate is
   begin
      WybiegLabel.Set_Text ("Wybieg: " & Integer'Image (WybiegCounter) & "/20");
   end WybiegUpdate;

   -- typ tasków dla czynno¶ci zwierz±t
   task type ScrollTaskAnimals (Id : Integer; Zwierze : Integer);

   task body ScrollTaskAnimals is
      K: Integer := 0;
      T: TupleA;
      Rodzaj : String := "12345";
   begin
      if Zwierze = 1 then
           Rodzaj := "Panda";
      else
           Rodzaj := "Lis  ";
      end if;
      if Id = 1 then -- wejscie na wybieg
            for K in 1..10 loop
               T := (K, 1, Zwierze);
               BWybieg.Wstaw(K, WybiegCounter);
               Messages2.Send (HandlerAnimals'Access, T);
               Request (+WybiegUpdate'Access);
               delay 0.5;
            end loop;
      end if;
      loop
         if Id = 2 then -- spanie
            BWybieg.Pobierz(K, WybiegCounter);
            if K /= 0 then
               Request (+WybiegUpdate'Access);
               T := (K, 2, Zwierze);
               Messages2.Send (HandlerAnimals'Access, T);
               BSpanie.Wstaw(K, SpanieCounter);
               Request (+SpanieUpdate'Access);
            end if;
         elsif Id = 3 then -- karmienie
            BWybieg.Pobierz(K, WybiegCounter);
            if K /= 0 then
               Request (+WybiegUpdate'Access);
               T := (K, 3, Zwierze);
               Messages2.Send (HandlerAnimals'Access, T);
               BKarmienie.Wstaw(K, KarmienieCounter);
               Request (+KarmienieUpdate'Access);
            end if;
         elsif Id = 4 then -- ze spania na wybieg
            BSpanie.Pobierz(K, SpanieCounter);
            if K /= 0 then
               Request (+SpanieUpdate'Access);
               T := (K, 4, Zwierze);
               Messages2.Send (HandlerAnimals'Access, T);
               Messages2.Send (HandlerAnimals'Access, (K, 1, Zwierze));
               BWybieg.Wstaw(K, WybiegCounter);
               Request (+WybiegUpdate'Access);
            end if;
         elsif Id = 5 then -- z karmienia na wybieg
            BKarmienie.Pobierz(K, KarmienieCounter);
            if K /= 0 then
               Request (+KarmienieUpdate'Access);
               T := (K, 5, Zwierze);
               Messages2.Send (HandlerAnimals'Access, T);
               Messages2.Send (HandlerAnimals'Access, (K, 1, Zwierze));
               BWybieg.Wstaw(K, WybiegCounter);
               Request (+WybiegUpdate'Access);
            end if;
         end if;
         delay 0.1;
      end loop;
   exception
      -- W przypadku b³êdu
      when Quit_Error =>
         null;
      when Error : others =>
         Say (Exception_Information (Error));
   end ScrollTaskAnimals;

begin
   -- inicjalizacja Gtk, tworzenie okna
   Gtk.Main.Init;
   Gtk_New (Window);
   Gtk.Main.Router.Init (Window);

   -- ustawienia okna
   Window.Set_Title ("Concurrent ZOO");
   Window.Set_Default_Size (1000, 800);
   Window.On_Delete_Event (Gtk.Missed.Delete_Event_Handler'Access);
   Window.On_Destroy (Gtk.Missed.Destroy_Handler'Access);

   -- ustawienia box'ów w oknie
   Box := Gtk_VBox_New;
   Window.Add (Box);

   Box0 := Gtk_Hbox_New;
   Box1H1 := Gtk_Hbox_New;
   Box1H2 := Gtk_Hbox_New;
   Box2H1 := Gtk_Hbox_New;
   Box2H2 := Gtk_Hbox_New;

   Box.Pack_Start(Child => Box0, Expand => False, Fill => False);
   Box.Pack_Start(Child => Box1H1, Expand => False, Fill => False);
   Box.Pack_Start(Child => Box1H2, Expand => True, Fill => True);
   Box.Pack_Start(Child => Box2H1, Expand => False, Fill => False);
   Box.Pack_Start(Child => Box2H2, Expand => True, Fill => True);

   -- tworzenie label'ów na liczniki oraz scroll'ów na logi (odwiedzaj±cy)
   Gtk_New (ZooLabel, "Zoo: 0/33");
   Gtk_New (TimeLabel, "Czas: 0:00");

   Gtk_New (FoxLabel, "Lisy: 0/5");
   Gtk_New (FoxView);
   Gtk_New (FoxScroll);
   FoxScroll.Add (FoxView);

   Gtk_New (PandyLabel, "Lisy: 0/5");
   Gtk_New (PandyView);
   Gtk_New (PandyScroll);
   PandyScroll.Add (PandyView);

   Gtk_New (WejscieLabel, "Wejscie: 0/20");
   Gtk_New (WejscieView);
   Gtk_New (WejscieScroll);
   WejscieScroll.Add (WejscieView);

   Gtk_New (KasaLabel, "Kasa: 0/3");
   Gtk_New (KasaView);
   Gtk_New (KasaScroll);
   KasaScroll.Add (KasaView);

   -- przypisanie label'ów oraz scroll'ów do odpowiednich box'ów (odwiedzaj±cy)
   Box0.Pack_Start (Child => ZooLabel, Expand => True, Fill => False);
   Box0.Pack_Start (Child => TimeLabel, Expand => True, Fill => False);

   Box1H1.Pack_Start (Child => FoxLabel, Expand => True, Fill => False);
   Box1H1.Pack_Start (Child => PandyLabel, Expand => True, Fill => False);
   Box1H1.Pack_Start (Child => WejscieLabel, Expand => True, Fill => False);
   Box1H1.Pack_Start (Child => KasaLabel, Expand => True, Fill => False);

   Box1H2.Pack_Start (Child => FoxScroll, Expand => True, Fill => True);
   Box1H2.Pack_Start (Child => PandyScroll, Expand => True, Fill => True);
   Box1H2.Pack_Start (Child => WejscieScroll, Expand => True, Fill => True);
   Box1H2.Pack_Start (Child => KasaScroll, Expand => True, Fill => True);

   -- tworzenie label'ów na liczniki oraz scroll'ów na logi (zwierzêta)
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

   -- przypisanie label'ów oraz scroll'ów do odpowiednich box'ów (zwierzêta)
   Box2H1.Pack_Start (Child => KarmienieLabel, Expand => True, Fill => False);
   Box2H1.Pack_Start (Child => SpanieLabel, Expand => True, Fill => False);
   Box2H1.Pack_Start (Child => WybiegLabel, Expand => True, Fill => False);

   Box2H2.Pack_Start (Child => KarmienieScroll, Expand => True, Fill => True);
   Box2H2.Pack_Start (Child => SpanieScroll, Expand => True, Fill => True);
   Box2H2.Pack_Start (Child => WybiegScroll, Expand => True, Fill => True);

   Box.Show_All;
   Window.Show;

   -- deklaracja task'ów
   declare
      Wejscie : ScrollTaskPeople(1);
      Kasa : ScrollTaskPeople(2);
      Lisy : ScrollTaskPeople(3);
      Pandy : ScrollTaskPeople(4);
      WyjscieLisy : ScrollTaskPeople(5);
      WyjsciePandy : ScrollTaskPeople(6);
      Pandy2Lisy : ScrollTaskPeople(7);
      Lisy2Pandy : ScrollTaskPeople(8);

      PWybieg : ScrollTaskAnimals(1, 1);
      PSpanie : ScrollTaskAnimals(2, 1);
      PKarmienie : ScrollTaskAnimals(3, 1);
      PSpanie2Wybieg : ScrollTaskAnimals(4, 1);
      PKarmienie2Wybieg : ScrollTaskAnimals(5, 1);

      LWybieg : ScrollTaskAnimals(1, 2);
      LSpanie : ScrollTaskAnimals(2, 2);
      LKarmienie : ScrollTaskAnimals(3, 2);
      LSpanie2Wybieg : ScrollTaskAnimals(4, 2);
      LKarmienie2Wybieg : ScrollTaskAnimals(5, 2);

   begin
      -- rozpoczêcie dzia³ania interfejsu
      Gtk.Main.Main;
      -- funkcja odpowiedzialna za zakoñczenie programu przy zamkniêciu okna
      GNAT.OS_Lib.OS_Exit (0);
   end;
exception
   -- W przypadku b³êdu
   when Error : others =>
      Say (Exception_Information (Error));
end Concurrent_Zoo;
