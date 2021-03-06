$ T i t l e   =   " E x c h a n g e   B a s i c   S e r v e r   I n f o r m a t i o n " 
  $ H e a d e r   = " E x c h a n g e   B a s i c   S e r v e r   I n f o r m a t i o n " 
  $ C o m m e n t s   =   " E x c h a n g e   B a s i c   S e r v e r   I n f o r m a t i o n " 
  $ D i s p l a y   =   " T a b l e " 
  $ A u t h o r   =   " J o h n   S n e d d o n " 
  $ P l u g i n V e r s i o n   =   1 . 0 
  $ P l u g i n C a t e g o r y   =   "Exchange" 
 
  #   S t a r t   o f   S e t t i n g s 
  #   E n d   o f   S e t t i n g s 
  
 F o r e a c h   ( $ e x S e r v e r   i n   ( $ e x S e r v e r s   |   W h e r e   {   $ _ . I s E x c h a n g e 2 0 0 7 O r L a t e r   }   |   S o r t   N a m e ) ) 
 { 
        $ O p e r a t i n g S y s t e m s   =   G e t - W m i O b j e c t   - c o m p u t e r n a m e     $ e x S e r v e r . N a m e   W i n 3 2 _ O p e r a t i n g S y s t e m 
 
       i f   ( $ e x S e r v e r . A d m i n D i s p l a y V e r s i o n   - m a t c h   " V e r s i o n   8 " )   
   { 
              $ r o l l U p K e y   =   " S O F T W A R E \ \ M i c r o s o f t \ \ W i n d o w s \ \ C u r r e n t V e r s i o n \ \ I n s t a l l e r \ \ U s e r D a t a \ \ S - 1 - 5 - 1 8 \ \ P r o d u c t s \ \ 4 6 1 C 2 B 4 2 6 6 E D E F 4 4 4 B 8 6 4 A D 6 D 9 E 5 B 6 1 3 \ \ P a t c h e s "   
    }
    E l s e I f   ( $ e x S e r v e r . A d m i n D i s p l a y V e r s i o n   - m a t c h   " V e r s i o n   1 4 " )   
   {
       $ r o l l U p K e y   =   " S O F T W A R E \ \ M i c r o s o f t \ \ W i n d o w s \ \ C u r r e n t V e r s i o n \ \ I n s t a l l e r \ \ U s e r D a t a \ \ S - 1 - 5 - 1 8 \ \ P r o d u c t s \ \ A E 1 D 4 3 9 4 6 4 E B 1 B 8 4 8 8 7 4 1 F F A 0 2 8 E 2 9 1 C \ \ P a t c h e s "   
       }   
   E l s e I f   ( $ e x S e r v e r . A d m i n D i s p l a y V e r s i o n   - m a t c h   " V e r s i o n   1 5 " )   
   { 
       $ r o l l U p K e y   =   " S O F T W A R E \ \ M i c r o s o f t \ \ W i n d o w s \ \ C u r r e n t V e r s i o n \ \ I n s t a l l e r \ \ U s e r D a t a \ \ S - 1 - 5 - 1 8 \ \ P r o d u c t s \ \ A E 1 D 4 3 9 4 6 4 E B 1 B 8 4 8 8 7 4 1 F F A 0 2 8 E 2 9 1 C \ \ P a t c h e s "   
        } 
 
    $ r e g i s t r y   =   [ M i c r o s o f t . W i n 3 2 . R e g i s t r y K e y ] : : O p e n R e m o t e B a s e K e y ( ' L o c a l M a c h i n e ' ,     $ e x S e r v e r . N a m e ) 
 
       i f   ( $ R e g i s t r y ) 
    { 
              $ i n s t a l l e d R o l l U p s   =   $ r e g i s t r y . O p e n S u b K e y ( $ r o l l U p K e y ) . G e t S u b K e y N a m e s ( ) 
              $ r u   =   @ ( ) 
              f o r e a c h   ( $ r o l l U p   i n   $ i n s t a l l e d R o l l U p s )   
      { 
                    $ t h i s R o l l U p   =   " $ r o l l U p K e y \ \ $ r o l l U p " 
                    $ r u   + =   N e w - O b j e c t   P S O b j e c t   - P r o p e r t y   @ { 
                          D a t e   =   $ t h i s R o l l U p   |   % { $ r e g i s t r y . O p e n S u b K e y ( $ _ ) . g e t v a l u e ( ' I n s t a l l e d ' ) } 
                          N a m e   =   $ t h i s R o l l U p   |   % { $ r e g i s t r y . O p e n S u b K e y ( $ _ ) . g e t v a l u e ( ' D i s p l a y N a m e ' ) } 
                    } 
              } 
              $ R o l l u p s   =   ( $ r u   |   S o r t   D a t e   |   S e l e c t   - E x p a n d P r o p e r t y   N a m e )   - j o i n   " < b r   / > " 
              $ I n s t D a t e s   =   ( $ r u   |   S o r t   D a t e   |   S e l e c t   - E x p a n d P r o p e r t y   D a t e )   - j o i n   " < b r   / > " 
        } 
 
       $ L B T i m e = $ O p e r a t i n g S y s t e m s . C o n v e r t T o D a t e T i m e ( $ O p e r a t i n g S y s t e m s . L a s t b o o t u p t i m e ) 
 
       N e w - O b j e c t   P S O b j e c t   - P r o p e r t y   @ { 
              " C o m p u t e r   N a m e "   =   $ e x S e r v e r . N a m e 
              " O p e r a t i n g   S y s t e m "   =   $ O p e r a t i n g S y s t e m s . C a p t i o n 
              " S e r v i c e   P a c k "   =   $ O p e r a t i n g S y s t e m s . C S D V e r s i o n 
              " E x c h a n g e   V e r s i o n "   =   $ e x S e r v e r . A d m i n D i s p l a y V e r s i o n 
              " R o l l u p s "   =   $ R o l l u p s   - r e p l a c e   ' ( . * ) ,   $ ' , ' $ 1 ' 
              " R o l l u p   I n s t a l l   D a t e s "   =   $ I n s t D a t e s   - r e p l a c e   ' ( . * ) ,   $ ' , ' $ 1 ' 
              " E x c h a n g e   E d i t i o n "   =   $ e x S e r v e r . E d i t i o n 
              " E x c h a n g e   R o l e ( s ) "   =   $ e x S e r v e r . S e r v e r R o l e 
        }   |   S e l e c t   " C o m p u t e r   N a m e " , " O p e r a t i n g   S y s t e m " ,   " S e r v i c e   P a c k " ,   " E x c h a n g e   V e r s i o n " ,   " R o l l u p s " ,   " R o l l u p   I n s t a l l   D a t e s " ,   " E x c h a n g e   E d i t i o n " ,   " E x c h a n g e   R o l e ( s ) " 
  } 
 
