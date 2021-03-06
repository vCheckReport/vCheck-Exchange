$ T i t l e   =   " E x c h a n g e   D r i v e   D e t a i l s " 
 $ H e a d e r   =   " E x c h a n g e   D r i v e   D e t a i l s " 
 $ C o m m e n t s   =   " E x c h a n g e   D r i v e   D e t a i l s " 
 $ D i s p l a y   =   " T a b l e " 
 $ A u t h o r   =   " J o h n   S n e d d o n " 
 $ P l u g i n V e r s i o n   =   1 . 0 
 $ P l u g i n C a t e g o r y   =   " E x c h a n g e " 
 
 #   S t a r t   o f   S e t t i n g s 
  #   R e p o r t   D e t a i l s   o n l y   f o r   d r i v e s   w i t h   < =   x %   f r e e   s p a c e 
  $ R e p o r t P e r c e n t   = 1 5 
  #   E n d   o f   S e t t i n g s 
  
 $ L o g i c a l D r i v e s   =   @ ( ) 
 
 F o r e a c h   ( $ s   i n   ( $ E x S e r v e r s   |   W h e r e   {   $ _ . I s E x c h a n g e 2 0 0 7 O r L a t e r   }   ) ) 
 {  
       $ T a r g e t   =   $ s . N a m e 
       $ D i s k s   =   G e t - W m i O b j e c t   - C o m p u t e r N a m e   $ T a r g e t   W i n 3 2 _ V o l u m e   |   s o r t   N a m e 
 
       F o r e a c h   ( $ L D r i v e   i n   ( $ D i s k s   |   W h e r e   { $ _ . D r i v e T y p e   - e q   3   - a n d   $ _ . L a b e l   - n e   " S y s t e m   R e s e r v e d " } ) )   
   { 
              $ D e t a i l s   =   " "   |   S e l e c t   " S e r v e r " ,   " N a m e " ,   L a b e l ,   " F i l e   S y s t e m " ,   " C a p a c i t y   ( G B ) " ,   " F r e e   S p a c e " ,   " %   F r e e   S p a c e " 
              $ F r e e P e r c e n t   =   [ M a t h ] : : R o u n d ( ( $ L D r i v e . F r e e S p a c e   /   1 G B )   /   ( $ L D r i v e . C a p a c i t y   /   1 G B )   *   1 0 0 ) 
  
             $ D e t a i l s . " S e r v e r "   =   $ s . N a m e 
              $ D e t a i l s . " N a m e "   =   $ L D r i v e . N a m e 
              $ D e t a i l s . L a b e l   =   $ L D r i v e . L a b e l 
              $ D e t a i l s . " F i l e   S y s t e m "   =   $ L D r i v e . F i l e S y s t e m 
              $ D e t a i l s . " C a p a c i t y   ( G B ) "   =   ( [ m a t h ] : : r o u n d ( ( $ L D r i v e . C a p a c i t y   /   1 G B ) ) ) . t o S t r i n g ( ) 
              $ D e t a i l s . " F r e e   S p a c e "   =   ( [ m a t h ] : : r o u n d ( ( $ L D r i v e . F r e e S p a c e   /   1 G B ) ) ) . t o S t r i n g ( ) 
              $ D e t a i l s . " %   F r e e   S p a c e "   =   $ F r e e P e r c e n t . t o S t r i n g ( ) 
  
             I f   ( $ F r e e P e r c e n t   - l e   $ R e p o r t P e r c e n t )   
      { 
                    $ L o g i c a l D r i v e s   + =   $ D e t a i l s 
              } 
       } 
 } 
  
 I f   ( $ L o g i c a l D r i v e s . C o u n t   - g t   0 )   
{    
        $ C o m m e n t s   =   " D r i v e s   o n   E x c h a n g e   S e r v e r   $ T a r g e t " 
 
       I f   ( $ R e p o r t P e r c e n t   - l t   1 0 0 )   
   { 
             $ C o m m e n t s   + =   "   w i t h   l e s s   t h a n   $ ( $ R e p o r t P e r c e n t ) %   f r e e   s p a c e " 
       } 
 
       $ H e a d e r   =   $ C o m m e n t s 
 } 
 
 $ L o g i c a l D r i v e s 
 
  $ T a b l e F o r m a t   =   @ { " %   F r e e   S p a c e "   =   @ ( @ {   " - l e   1 0 "           =   " R o w , c l a s s | c r i t i c a l "   } ;
                                                                         @ {   " - l e   1 5 "           =   " R o w , c l a s s | w a r n i n g " ;   } ) ; 
                } 
