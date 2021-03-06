$ T i t l e   =   " E x c h a n g e   S e r v i c e s "  
 $ H e a d e r   =   " E x c h a n g e   S e r v i c e s " 
 $ C o m m e n t s   =   " E x c h a n g e   S e r v i c e s   f o r   E x c h a n g e   2 0 1 0   a n d   a b o v e " 
 $ D i s p l a y   =   " T a b l e " 
 $ A u t h o r   =   " J o h n   S n e d d o n " 
 $ P l u g i n V e r s i o n   =   1 . 0 
 $ P l u g i n C a t e g o r y   =   " E x c h a n g e " 

 #   B a s e d   o n   c o d e   i n   h t t p : / / w w w . p o w e r s h e l l n e e d f u l t h i n g s . c o m / ? p a g e _ i d = 2 8 1 
 
 #   S t a r t   o f   S e t t i n g s 
 #   E x c h a n g e   S e r v i c e s   -   O n l y   r e p o r t   o n   t h o s e   i n   a n   u n e x p e c t e d   s t a t e 
 $ R e p o r t U n e x p e c t e d O n l y = $ t r u e 
 #   E n d   o f   S e t t i n g s 

 $ S e r v i c e s   =   @ ( ) 
 
 F o r E a c h   ( $ S e r v e r   i n   ( $ E x S e r v e r s   |   W h e r e   {   $ _ . I s E x c h a n g e 2 0 0 7 O r L a t e r   } ) )   
{    
       $ T a r g e t   =   $ S e r v e r . N a m e 
 
       $ L i s t O f S e r v i c e s   =   ( g w m i   - c o m p u t e r   $ T a r g e t   - q u e r y   " s e l e c t   *   f r o m   w i n 3 2 _ s e r v i c e   w h e r e   N a m e   l i k e   ' M S E x c h a n g e % '   o r   N a m e   l i k e   ' I I S % '   o r   N a m e   l i k e   ' S M T P % '   o r   N a m e   l i k e   ' P O P % '   o r   N a m e   l i k e   ' W 3 S V C % ' " ) 
 
      F o r e a c h   ( $ S e r v i c e   i n   $ L i s t O f S e r v i c e s ) 
   { 
             $ D e t a i l s   =   " "   |   S e l e c t   S e r v e r ,   N a m e , A c c o u n t , " S t a r t   M o d e " , S t a t e , " E x p e c t e d   S t a t e " 
 
             $ D e t a i l s . S e r v e r   =   $ S e r v e r . N a m e 
              $ D e t a i l s . N a m e   =   $ S e r v i c e . C a p t i o n 
              $ D e t a i l s . A c c o u n t   =   $ S e r v i c e . S t a r t n a m e 
              $ D e t a i l s . " S t a r t   M o d e "   =   $ S e r v i c e . S t a r t M o d e 
              $ D e t a i l s . S t a t e   =   $ S e r v i c e . S t a t e 
              $ D e t a i l s . " E x p e c t e d   S t a t e "   =   " O K " 
 
             I f   ( $ S e r v i c e . S t a r t M o d e   - e q   " A u t o "   - a n d   $ S e r v i c e . S t a t e   - n e   " R u n n i n g " )   
      { 
                    $ D e t a i l s . " E x p e c t e d   S t a t e "   =   " U n e x p e c t e d " 
              } 
             E l s e I f   ( $ S e r v i c e . S t a r t M o d e   - e q   " D i s a b l e d "   - a n d   $ S e r v i c e . S t a t e   - e q   " R u n n i n g " )   
      { 
                   $ D e t a i l s . " E x p e c t e d   S t a t e "   =   " U n e x p e c t e d " 
             } 
 
             I f   ( ! $ R e p o r t U n e x p e c t e d O n l y   - o r   $ D e t a i l s . " E x p e c t e d   S t a t e "   - n e   " O K " )   
      {
                   $ S e r v i c e s   + =   $ D e t a i l s 
             } 
       } 
 
       I f   ( $ S e r v i c e s   - n e   $ n u l l )   
   { 
             $ H e a d e r   =   " E x c h a n g e   S e r v i c e s   o n   $ T a r g e t " 
 
             I f   ( $ R e p o r t U n e x p e c t e d O n l y )   
      { 
                   $ H e a d e r   + =   "   w h i c h   a r e   n o t   i n   t h e i r   e x p e c t e d   s t a t e " 
             } 
       } 
 } 
 
 $ S e r v i c e s 
