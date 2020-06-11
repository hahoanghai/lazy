//+------------------------------------------------------------------+
//|                                                         Lazy.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//--- input parameters
input double   Lot1=3.0;
input double   Lot2=1.0;
input double   Lot3=1.0;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
datetime last;

int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
      if(last != Time[0]){
      
         XoaLenhCu("Lazy");
      
         OrderSend(
            Symbol(),
            OP_BUYSTOP,
            Lot1,
            iHigh(Symbol(), PERIOD_D1, 1),
            0,
            iHigh(Symbol(), PERIOD_D1, 1) - 0.0005,
            iHigh(Symbol(), PERIOD_D1, 1) + 0.0005,
            "Lazy"
         );
         
         OrderSend(
            Symbol(),
            OP_BUYSTOP,
            Lot2,
            iHigh(Symbol(), PERIOD_D1, 1),
            0,
            iHigh(Symbol(), PERIOD_D1, 1) - 0.0005,
            iHigh(Symbol(), PERIOD_D1, 1) + 0.0010,
            "Lazy"
         );
         
         OrderSend(
            Symbol(),
            OP_BUYSTOP,
            Lot3,
            iHigh(Symbol(), PERIOD_D1, 1),
            0,
            iHigh(Symbol(), PERIOD_D1, 1) - 0.0005,
            iHigh(Symbol(), PERIOD_D1, 1) + 0.0015,
            "Lazy"
         );
         
         OrderSend(
            Symbol(),
            OP_SELLSTOP,
            Lot1,
            iLow(Symbol(), PERIOD_D1, 1),
            0,
            iLow(Symbol(), PERIOD_D1, 1) + 0.0005,
            iLow(Symbol(), PERIOD_D1, 1) - 0.0005,
            "Lazy"
         );
         
         OrderSend(
            Symbol(),
            OP_SELLSTOP,
            Lot2,
            iLow(Symbol(), PERIOD_D1, 1),
            0,
            iLow(Symbol(), PERIOD_D1, 1) + 0.0005,
            iLow(Symbol(), PERIOD_D1, 1) - 0.0010,
            "Lazy"
         );
         
         OrderSend(
            Symbol(),
            OP_SELLSTOP,
            Lot3,
            iLow(Symbol(), PERIOD_D1, 1),
            0,
            iLow(Symbol(), PERIOD_D1, 1) + 0.0005,
            iLow(Symbol(), PERIOD_D1, 1) - 0.0015,
            "Lazy"
         );
      
         last = Time[0];
      }
   
  }
  
void XoaLenhCu(string comm){
   for(int i = OrdersTotal() - 1; i >= 0; i--){
      if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES)){ continue; }
      if(OrderComment() == comm){
         OrderDelete(OrderTicket(), Red);
      }
   }
}
//+------------------------------------------------------------------+
