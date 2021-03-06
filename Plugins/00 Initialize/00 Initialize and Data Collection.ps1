$ T i t l e   =   " E x c h a n g e   L o a d   S n a p i n "  $ H e a d e r   = " E x c h a n g e   L o a d   S n a p i n " 
 $ C o m m e n t s   =   " E x c h a n g e   2 0 x x   L o a d   S n a p i n " 
 $ D i s p l a y   =   " N o n e " 
 $ A u t h o r   =   " J o h n   S n e d d o n " 
 $ P l u g i n V e r s i o n   =   1 . 0
 $ P l u g i n C a t e g o r y   =   " E x c h a n g e " 
 
 #   B a s e d   o n   i d e a s   i n   h t t p : / / w w w . s t e v i e g . o r g / 2 0 1 1 / 0 6 / e x c h a n g e - e n v i r o n m e n t - r e p o r t /  #     a n d   h t t p : / / w w w . p o w e r s h e l l n e e d f u l t h i n g s . c o m / ? p a g e _ i d = 2 8 1 
 
  #   S t a r t   o f   S e t t i n g s   #   E n d   o f   S e t t i n g s 
 
 if (!(Get-PSSnapin -name Microsoft.Exchange.Management.PowerShell.SnapIn -ErrorAction SilentlyContinue) -and    (Get-PSSnapin -Name Microsoft.Exchange.Management.PowerShell.SnapIn -ErrorAction SilentlyContinue -Registered).Count -gt 0){    Add-PSSnapin Microsoft.Exchange.Management.PowerShell.SnapIn} C o n n e c t - E x c h a n g e S e r v e r   - a u t o   - A l l o w C l o b b e r  
 W r i t e - C u s t o m O u t   " F e t c h i n g   E x c h a n g e   S e r v e r s "   $ E x S e r v e r s   =   G e t - E x c h a n g e S e r v e r   - s t a t u s   |   W h e r e   { $ _ . I s E 1 4 O r L a t e r   }   |   S o r t   N a m e 
 
 W r i t e - C u s t o m O u t   " F e t c h i n g   D A G   I n f o r m a t i o n "   $ D A G s   =   G e t - D a t a b a s e A v a i l a b i l i t y G r o u p   - S t a t u s   |   S o r t   N a m e 
 
 W r i t e - C u s t o m O u t   " F e t c h i n g   D a t a b a s e   I n f o r m a t i o n "   $ D a t a b a s e s   =   G e t - M a i l b o x D a t a b a s e   - S t a t u s   |   S o r t   N a m e 
 
 W r i t e - C u s t o m O u t   " F e t c h i n g   M a i l b o x   I n f o r m a t i o n "   $ M B s   =   G e t - M a i l b o x   - R e s u l t S i z e   U n l i m i t e d 
 
 W r i t e - C u s t o m O u t   " F e t c h i n g   M a i l b o x   S t a t i s t i c s "   $ M B S t a t s   =   $ D a t a b a s e s   |   W h e r e   { $ _ . M o u n t e d }   |   % {   G e t - M a i l b o x S t a t i s t i c s   - D a t a b a s e   $ _ . N a m e   } 
 
 W r i t e - C u s t o m O u t   " F e t c h i n g   A c t i v e S y n c   I n f o r m a t i o n "   $ M o b i l e D e v i c e s   =   G e t - M o b i l e D e v i c e 
 
 W r i t e - C u s t o m O u t   " F e t c h i n g   A c t i v e S y n c   D e v i c e   A c c e s s   R u l e s "   $ E A S A c c e s s R u l e s   =   G e t - A c t i v e S y n c D e v i c e A c c e s s R u l e 
 
  #   C h a n g e l o g   #   - - - - - - - - - 
  #   1 . 0   I n i t i a l   r e l e a s e 
  #   1 . 1   A d d e d   A c t i v e S y n c   D e v i c e s 
  #   1 . 2   A d d   M a i l b o x   S t a t s 
  #   1 . 3   A d d   E A S   A c c e s s   R u l e s 
