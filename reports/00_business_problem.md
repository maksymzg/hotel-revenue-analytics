# Business Understanding — ITC Hotels Revenue & Profitability

## Persona i kontekst
Analityk revenue/biznesowy w sieci **ITC Hotels** (15 obiektów w Indiach: kategorie Luxury / Resort / Business).
Moment: początek 2023 — zarząd ocenia dane 2021–2022 (odbicie po COVID).

## Pytanie biznesowe (brief od zarządu)
> „Skąd realnie pochodzi nasz przychód, **gdzie tracimy marżę**, i które dźwignie — kanał, segment, ceny, rabaty — mamy pociągnąć, żeby rosnąć **rentownie** w fazie odbicia?"

Projekt kończy się **rekomendacjami z oszacowanym wpływem w ₹**, nie samymi wykresami.

## Kierunek analityczny
Revenue & Profitability Analytics + analiza kanałów/segmentów + **wyciek marży na rabatach**, z osią czasu „odbicie po COVID".
Świadomie odrzucone: forecasting (tylko 2 lata danych), RevPAR jako KPI (brak inventory — patrz Ograniczenia).

## KPI

### Podstawowe
| KPI | Definicja w danych |
|---|---|
| Net / Gross Revenue | sumy kolumn |
| Margin % | Net / Gross |
| ADR (Average Daily Rate) | przychód pokojowy / liczba room-nights |
| ALOS (Avg Length of Stay) | śr. `Nights_Stayed` |
| Cancellation Rate | Cancelled / wszystkie rezerwacje |
| Discount Rate | Discount / Gross |
| Channel mix % | udział kanału w przychodzie |
| Revenue per Booking / Guest | przychód / liczba |
| YoY growth | 2022 vs 2021 |

### Zaawansowane (wyróżniki)
1. **Margin Leakage Rate w czasie** — `(Gross − Net)/Gross` lub `Discount/Gross` per dzień/tydzień; piki = okresy największego wycieku marży. Mocny storytelling czasowy.
2. **Revenue at Risk %** — przychód rezerwacji anulowanych ÷ całość, w rozbiciu na kanał/segment. Karmi scenariusz polityki depozytu.
3. **Discount Effectiveness** — zależność głębokości rabatu od wolumenu i ratingu (per kanał/segment). Rabat rośnie, a wolumen/rating płaski → czysty wyciek.

## Pytania biznesowe i hipotezy
| # | Pytanie | Hipoteza | Możliwy insight |
|---|---|---|---|
| Q1 | Które hotele/kategorie/miasta dają przychód i marżę? | Resorty (Goa) napędziły odbicie 2022; Business w metropoliach został w tyle | przesuń marketing do leisure |
| Q2 | Który kanał daje wartościowe rezerwacje vs niską marżę? | OTA (Booking.com) = wyższy rabat, niższa marża/rezerwację | renegocjuj prowizje / pchaj direct |
| Q3 | Czy rabaty coś dają, czy to wyciek? | rabaty > X% nie podnoszą ratingu ani powtarzalności | capuj rabaty w segmencie Business |
| Q4 | Wartość segmentów (VIP/Corporate/Regular)? | VIP/Corporate: wyższe ADR i ALOS, ryzyko koncentracji | program retencji top klientów |
| Q5 | Kto anuluje i ile przychodu zagrożone? | OTA/Walk-in anulują częściej niż Corporate | polityka depozytu na kanałach ryzyka |
| Q6 | Sezonowość i odbicie po COVID? | miesiące High Covid_Impact = niższy przychód; odbicie nierówne wg miasta | recovery napędzany przez kilka miast |

## Flagowa analiza what-if: polityka depozytu
Metodyka „nie znamy reakcji → scenariusz z jawnymi założeniami + wrażliwość":
1. **Revenue at Risk:** ile przychodu siedzi w anulacjach, wg kanału/segmentu → „X% kapitału zagrożone".
2. **Model depozytu:** depozyt 20% bezzwrotny redukuje anulacje o R%; testuj **R = 10% / 25% / 40%** → tabela odzyskanego przychodu (sensitivity).
3. **Trade-off:** depozyt może odstraszyć część rezerwacji (tarcie) — odnotować, nawet bez kwantyfikacji.

## Zakres i ograniczenia danych
- Dane **syntetyczne**, realistyczne — wnioski ilustrują metodę, nie realia firmy.
- **RevPAR:** brak liczby pokoi → nie jest KPI. Pokazujemy dolny limit pojemności z nakładania pobytów (max jednoczesnych pokojo-nocy per hotel/dzień) + opis, jak policzyć mając inventory. To pomiar „wykorzystania względem własnego szczytu", nie absolutnego occupancy.
- **Brak ID klienta** (Customer_Type to klasa, nie osoba) → brak prawdziwego CLV/retencji.
- Daty zapisane jako serial Excela → konwersja w etapie czyszczenia.
- Kilka ujemnych `Net_Revenue`/`GST` (anulacje) → obsługa w czyszczeniu.
