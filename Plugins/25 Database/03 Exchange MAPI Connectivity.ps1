#   S t a r t   o f   S e t t i n g s 
  #   R e p o r t   o n   M A P I   L a t e n c y   > =   x   m i l l i s e c o n d s 
  $ M i n L a t e n c y = 5 0 
  #   E n d   o f   S e t t i n g s 
 
  F o r E a c h   ( $ s e r v e r   i n   ( $ e x S e r v e r s   |   W h e r e   { $ _ . I s M a i l b o x S e r v e r } ) )   
{  
       T e s t - M A P I C o n n e c t i v i t y   - S e r v e r   $ S e r v e r   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e   |  
             W h e r e   {   $ _ . R e s u l t . V a l u e   - n e   " S u c c e s s "   - o r   ( [ M a t h ] : : R o u n d ( ( [ T i m e S p a n ]   $ _ . L a t e n c y ) . T o t a l M i l l i S e c o n d s ) )   - g e   $ M i n L a t e n c y   }   | 
             S o r t   S e r v e r , D a t a b a s e   | 
             S e l e c t   S e r v e r , D a t a b a s e ,   R e s u l t ,   @ { N a m e = " L a t e n c y   ( m S ) " ; e x p r e s s i o n = { [ M a t h ] : : R o u n d ( ( [ T i m e S p a n ]   $ _ . L a t e n c y ) . T o t a l M i l l i S e c o n d s ) } } ,   E r r o r 
 } 
 
 $ T a b l e F o r m a t   =   @ { " R e s u l t "   =   @ ( @ {   " - e q   ' * F A I L U R E * ' "           =   " c e l l , c l a s s | c r i t i c a l T e x t "   } ) } 
 
 $ T i t l e   =   " E x c h a n g e   M A P I   C o n n e c t i v i t y " 
 $ H e a d e r   =     " E x c h a n g e   M A P I   C o n n e c t i v i t y " 
 $ C o m m e n t s   =   " E x c h a n g e   M A P I   C o n n e c t i v i t y   w h e r e   L a t e n c y   > =   $ ( $ M i n L a t e n c y ) m s   o r   R e s u l t   n o t   ' S u c c e s s ' " 
 $ D i s p l a y   =   " T a b l e " 
 $ A u t h o r   =   " J o h n   S n e d d o n " 
 $ P l u g i n V e r s i o n   =   1 . 0 
 $ P l u g i n C a t e g o r y   =   " E x c h a n g e 2 0 1 0 " 
