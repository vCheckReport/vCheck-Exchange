#   S t a r t   o f   S e t t i n g s 
 #   R e p o r t   M e s s a g e   Q u e u e s   w i t h   > =   x   m e s s a g e s 
 $ M e s s a g e Q u e u e T h r e s h o l d = 5 0 
 # I g n o r e   Q u e u e s   m a t c h i n g   t h i s   e x p r e s s i o n 
 $ i g n o r e Q u e u e s = " \ \ S h a d o w \ \ " 
 #   E n d   o f   S e t t i n g s 
 
 G e t - Q u e u e   |   W h e r e   {   $ _ . M e s s a g e C o u n t   - g e   $ M e s s a g e Q u e u e T h r e s h o l d   - a n d   $ _ . I d e n t i t y   - n o t M a t c h   $ i g n o r e Q u e u e s }   |   S e l e c t   I d e n t i t y ,   S t a t u s ,   D e l i v e r y T y p e ,   M e s s a g e C o u n t ,   N e x t H o p D o m a i n 
 
 $ T i t l e   =   " E x c h a n g e   H u b   T r a n s p o r t   M a i l   Q u e u e s " 
 $ H e a d e r   =   " E x c h a n g e   H u b   T r a n s p o r t   M a i l   Q u e u e s " 
 $ C o m m e n t s   =   " H u b   T r a n s p o r t   M a i l   Q u e u e s   i g n o r i n g   q u e u e s   m a t c h i n g   $ ( $ i g n o r e Q u e u e s ) " 
 $ D i s p l a y   =   " T a b l e " 
 $ A u t h o r   =   " J o h n   S n e d d o n " 
 $ P l u g i n V e r s i o n   =   1 . 0 
 $ P l u g i n C a t e g o r y   =   " E x c h a n g e " 
