FasdUAS 1.101.10   ��   ��    k             l     ��������  ��  ��        l     �� 	 
��   	    AppDelegate.applescript    
 �   2     A p p D e l e g a t e . a p p l e s c r i p t      l     ��  ��       Policy Helper     �        P o l i c y   H e l p e r      l     ��������  ��  ��        l     ��  ��        Created by S on 5/27/19.     �   4     C r e a t e d   b y   S   o n   5 / 2 7 / 1 9 .      l     ��  ��    8 2  Copyright � 2019 SCTCoding. All rights reserved.     �   d     C o p y r i g h t   �   2 0 1 9   S C T C o d i n g .   A l l   r i g h t s   r e s e r v e d .      l     ��������  ��  ��         l     ��������  ��  ��      ! " ! h     �� #�� 0 appdelegate AppDelegate # k       $ $  % & % j     �� '
�� 
pare ' 4     �� (
�� 
pcls ( m     ) ) � * *  N S O b j e c t &  + , + l     ��������  ��  ��   ,  - . - l      / 0 1 / j   	 �� 2�� 0 windowtitle WindowTitle 2 m   	 
��
�� 
msng 0  # Window Title    1 � 3 3  #   W i n d o w   T i t l e .  4 5 4 l     ��������  ��  ��   5  6 7 6 l      8 9 : 8 j    �� ;�� &0 policybasicaction PolicyBasicAction ; m    ��
�� 
msng 9  # Policy action reminder    : � < < 0 #   P o l i c y   a c t i o n   r e m i n d e r 7  = > = l     ��������  ��  ��   >  ? @ ? l      A B C A j    �� D�� 80 customizationdescription_1 CustomizationDescription_1 D m    ��
�� 
msng B  # Descriptor 1    C � E E  #   D e s c r i p t o r   1 @  F G F l     ��������  ��  ��   G  H I H l      J K L J j    �� M�� 80 customizationdescription_2 CustomizationDescription_2 M m    ��
�� 
msng K  # Descriptor 2    L � N N  #   D e s c r i p t o r   2 I  O P O l     ��������  ��  ��   P  Q R Q l      S T U S j    �� V�� 80 customizationdescription_3 CustomizationDescription_3 V m    ��
�� 
msng T  # Descriptor 3    U � W W  #   D e s c r i p t o r   3 R  X Y X l     ��������  ��  ��   Y  Z [ Z l      \ ] ^ \ j    �� _�� 80 customizationdescription_4 CustomizationDescription_4 _ m    ��
�� 
msng ]  # Descriptor 4    ^ � ` `  #   D e s c r i p t o r   4 [  a b a l     ��������  ��  ��   b  c d c l      e f g e j    �� h�� 80 customizationdescription_5 CustomizationDescription_5 h m    ��
�� 
msng f  # Descriptor 5    g � i i  #   D e s c r i p t o r   5 d  j k j l     ��������  ��  ��   k  l m l l      n o p n j     �� q�� 0 select1   q m    ��
�� 
msng o  # Checkbox 1    p � r r  #   C h e c k b o x   1 m  s t s l     ��������  ��  ��   t  u v u l      w x y w j   ! #�� z�� 0 select2   z m   ! "��
�� 
msng x  # Checkbox 2    y � { {  #   C h e c k b o x   2 v  | } | l     ��������  ��  ��   }  ~  ~ l      � � � � j   $ &�� ��� 0 select3   � m   $ %��
�� 
msng �  # Checkbox 3    � � � �  #   C h e c k b o x   3   � � � l     ��������  ��  ��   �  � � � l      � � � � j   ' )�� ��� 0 select4   � m   ' (��
�� 
msng �  # Checkbox 4    � � � �  #   C h e c k b o x   4 �  � � � l     ��������  ��  ��   �  � � � l      � � � � j   * ,�� ��� 0 select5   � m   * +��
�� 
msng �  # Checkbox 5    � � � �  #   C h e c k b o x   5 �  � � � l     ��������  ��  ��   �  � � � l      � � � � j   - /�� ��� 0 select1value   � m   - .��
�� 
msng �  # Select State 1    � � � �   #   S e l e c t   S t a t e   1 �  � � � l     ��������  ��  ��   �  � � � l      � � � � j   0 2�� ��� 0 select2value   � m   0 1��
�� 
msng �  # Select State 2    � � � �   #   S e l e c t   S t a t e   2 �  � � � l     ��������  ��  ��   �  � � � l      � � � � j   3 5�� ��� 0 select3value   � m   3 4��
�� 
msng �  # Select State 3    � � � �   #   S e l e c t   S t a t e   3 �  � � � l     ��������  ��  ��   �  � � � l      � � � � j   6 :�� ��� 0 select4value   � m   6 7��
�� 
msng �  # Select State 4    � � � �   #   S e l e c t   S t a t e   4 �  � � � l     ��������  ��  ��   �  � � � l      � � � � j   ; ?�� ��� 0 select5value   � m   ; <��
�� 
msng �  # Select State 5    � � � �   #   S e l e c t   S t a t e   5 �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   �  
 IBOutlets    � � � �    I B O u t l e t s �  � � � j   @ D�� ��� 0 	thewindow 	theWindow � m   @ A��
�� 
msng �  � � � l     ��������  ��  ��   �  � � � i   E H � � � I      �� ����� B0 applicationwillfinishlaunching_ applicationWillFinishLaunching_ �  ��� � o      ���� 0 anotification aNotification��  ��   � k    B � �  � � � l     �� � ���   � R L Insert code here to initialize your application before any files are opened    � � � � �   I n s e r t   c o d e   h e r e   t o   i n i t i a l i z e   y o u r   a p p l i c a t i o n   b e f o r e   a n y   f i l e s   a r e   o p e n e d �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � 6 0# Check if the plist exists. If it doesn't quit.    � � � � ` #   C h e c k   i f   t h e   p l i s t   e x i s t s .   I f   i t   d o e s n ' t   q u i t . �  � � � r      � � � I    �� ���
�� .sysoexecTEXT���     TEXT � m      � � � � � � i f   [ [   - f   " / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t "   ] ] ;   t h e n   e c h o   " T R U E " ;   e l s e   e c h o   " F A L S E " ;   f i ;��   � o      ���� 0 
plistcheck   �  � � � l   �������  ��  �   �  � � � Z     � ��~�} � =    � � � o    	�|�| 0 
plistcheck   � m   	 
 � � � � � 
 F A L S E � I   �{�z�y
�{ .aevtquitnull��� ��� null�z  �y  �~  �}   �  � � � l   �x�w�v�x  �w  �v   �  � � � l   �u � ��u   �  # Force to front    � � � �   #   F o r c e   t o   f r o n t �  � � � O   " � � � I   !�t�s�r
�t .miscactvnull��� ��� null�s  �r   �  f     �  �  � l  # #�q�p�o�q  �p  �o     l  # #�n�n    # Set the window title    � , #   S e t   t h e   w i n d o w   t i t l e  r   # *	 I  # (�m
�l
�m .sysoexecTEXT���     TEXT
 m   # $ � � d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   W i n d o w T i t l e�l  	 o      �k�k 0 titleofwindow    r   + 4 o   + ,�j�j 0 titleofwindow   l     �i�h n       o   1 3�g�g 0 stringvalue stringValue o   , 1�f�f 0 windowtitle WindowTitle�i  �h    l  5 5�e�d�c�e  �d  �c    l  5 5�b�b   . (# Set the default policy action reminder    � P #   S e t   t h e   d e f a u l t   p o l i c y   a c t i o n   r e m i n d e r  r   5 < I  5 :�a�`
�a .sysoexecTEXT���     TEXT m   5 6   �!! � P o l i c y B a s i c A c t i o n = $ ( d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   P o l i c y B a s i c A c t i o n ) ;   e c h o   $ P o l i c y B a s i c A c t i o n�`   o      �_�_ 0 defaultaction   "#" r   = F$%$ o   = >�^�^ 0 defaultaction  % l     &�]�\& n      '(' o   C E�[�[ 0 stringvalue stringValue( o   > C�Z�Z &0 policybasicaction PolicyBasicAction�]  �\  # )*) l  G G�Y�X�W�Y  �X  �W  * +,+ l  G G�V-.�V  - 9 3# Set the item status variables based on the plist.   . �// f #   S e t   t h e   i t e m   s t a t u s   v a r i a b l e s   b a s e d   o n   t h e   p l i s t ., 010 r   G N232 I  G L�U4�T
�U .sysoexecTEXT���     TEXT4 m   G H55 �66 � d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   C u s t o m 1 S t a t e�T  3 o      �S�S 0 custom1status  1 787 l  O O�R�Q�P�R  �Q  �P  8 9:9 r   O V;<; I  O T�O=�N
�O .sysoexecTEXT���     TEXT= m   O P>> �?? � d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   C u s t o m 2 S t a t e�N  < o      �M�M 0 custom2status  : @A@ l  W W�L�K�J�L  �K  �J  A BCB r   W ^DED I  W \�IF�H
�I .sysoexecTEXT���     TEXTF m   W XGG �HH � d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   C u s t o m 3 S t a t e�H  E o      �G�G 0 custom3status  C IJI l  _ _�F�E�D�F  �E  �D  J KLK r   _ fMNM I  _ d�CO�B
�C .sysoexecTEXT���     TEXTO m   _ `PP �QQ � d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   C u s t o m 4 S t a t e�B  N o      �A�A 0 custom4status  L RSR l  g g�@�?�>�@  �?  �>  S TUT r   g nVWV I  g l�=X�<
�= .sysoexecTEXT���     TEXTX m   g hYY �ZZ � d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   C u s t o m 5 S t a t e�<  W o      �;�; 0 custom5status  U [\[ l  o o�:�9�8�:  �9  �8  \ ]^] l  o o�7_`�7  _ v p# For each item check if false. If so then disable item. if not enable time and set item description from plist.   ` �aa � #   F o r   e a c h   i t e m   c h e c k   i f   f a l s e .   I f   s o   t h e n   d i s a b l e   i t e m .   i f   n o t   e n a b l e   t i m e   a n d   s e t   i t e m   d e s c r i p t i o n   f r o m   p l i s t .^ bcb Z   o �de�6fd =  o rghg o   o p�5�5 0 custom1status  h m   p qii �jj 
 F A L S Ee k   u �kk lml O  u �non I   } ��4p�3�4 0 setenabled_ setEnabled_p q�2q m   ~ �1
�1 boovfals�2  �3  o o   u z�0�0 0 select1  m r�/r O  � �sts I   � ��.u�-�. 0 setenabled_ setEnabled_u v�,v m   � ��+
�+ boovfals�,  �-  t o   � ��*�* 80 customizationdescription_1 CustomizationDescription_1�/  �6  f k   � �ww xyx O  � �z{z I   � ��)|�(�) 0 setenabled_ setEnabled_| }�'} m   � ��&
�& boovtrue�'  �(  { o   � ��%�% 0 select1  y ~~ O  � ���� I   � ��$��#�$ 0 setenabled_ setEnabled_� ��"� m   � ��!
�! boovtrue�"  �#  � o   � �� �  80 customizationdescription_1 CustomizationDescription_1 ��� r   � ���� I  � ����
� .sysoexecTEXT���     TEXT� m   � ��� ��� � d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   C u s t o m i z a t i o n 1�  � o      �� 0 description1  � ��� r   � ���� o   � ��� 0 description1  � l     ���� n      ��� o   � ��� 0 stringvalue stringValue� o   � ��� 80 customizationdescription_1 CustomizationDescription_1�  �  �  c ��� l  � �����  �  �  � ��� Z   �&����� =  � ���� o   � ��� 0 custom2status  � m   � ��� ��� 
 F A L S E� k   � ��� ��� O  � ���� I   � ����� 0 setenabled_ setEnabled_� ��� m   � ��
� boovfals�  �  � o   � ��� 0 select2  � ��� O  � ���� I   � ����
� 0 setenabled_ setEnabled_� ��	� m   � ��
� boovfals�	  �
  � o   � ��� 80 customizationdescription_2 CustomizationDescription_2�  �  � k   �&�� ��� O  ���� I   ����� 0 setenabled_ setEnabled_� ��� m   � ��
� boovtrue�  �  � o   � ��� 0 select2  � ��� O ��� I  ��� � 0 setenabled_ setEnabled_� ���� m  ��
�� boovtrue��  �   � o  ���� 80 customizationdescription_2 CustomizationDescription_2� ��� r  ��� I �����
�� .sysoexecTEXT���     TEXT� m  �� ��� � d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   C u s t o m i z a t i o n 2��  � o      ���� 0 description2  � ���� r  &��� o  ���� 0 description2  � l     ������ n      ��� o  #%���� 0 stringvalue stringValue� o  #���� 80 customizationdescription_2 CustomizationDescription_2��  ��  ��  � ��� l ''��������  ��  ��  � ��� Z  '������� = ',��� o  '(���� 0 custom3status  � m  (+�� ��� 
 F A L S E� k  /N�� ��� O />��� I  7=������� 0 setenabled_ setEnabled_� ���� m  89��
�� boovfals��  ��  � o  /4���� 0 select3  � ���� O ?N��� I  GM������� 0 setenabled_ setEnabled_� ���� m  HI��
�� boovfals��  ��  � o  ?D���� 80 customizationdescription_3 CustomizationDescription_3��  ��  � k  Q��� ��� O Q`��� I  Y_������� 0 setenabled_ setEnabled_� ���� m  Z[��
�� boovtrue��  ��  � o  QV���� 0 select3  � ��� O ap��� I  io������� 0 setenabled_ setEnabled_� ���� m  jk��
�� boovtrue��  ��  � o  af���� 80 customizationdescription_3 CustomizationDescription_3� ��� r  qz��� I qx�����
�� .sysoexecTEXT���     TEXT� m  qt�� ��� � d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   C u s t o m i z a t i o n 3��  � o      ���� 0 description3  � ���� r  {���� o  {|���� 0 description3  � l     ������ n      ��� o  ������ 0 stringvalue stringValue� o  |����� 80 customizationdescription_3 CustomizationDescription_3��  ��  ��  � ��� l ����������  ��  ��  � ��� Z  �������� = ����� o  ������ 0 custom4status  � m  ���� ��� 
 F A L S E� k  ���� � � O �� I  �������� 0 setenabled_ setEnabled_ �� m  ����
�� boovfals��  ��   o  ������ 0 select4    �� O �� I  �������� 0 setenabled_ setEnabled_ 	��	 m  ����
�� boovfals��  ��   o  ������ 80 customizationdescription_4 CustomizationDescription_4��  ��  � k  ��

  O �� I  �������� 0 setenabled_ setEnabled_ �� m  ����
�� boovtrue��  ��   o  ������ 0 select4    O �� I  �������� 0 setenabled_ setEnabled_ �� m  ����
�� boovtrue��  ��   o  ������ 80 customizationdescription_4 CustomizationDescription_4  r  �� I ������
�� .sysoexecTEXT���     TEXT m  �� � � d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   C u s t o m i z a t i o n 4��   o      ���� 0 description4   �� r  ��  o  ������ 0 description4    l     !����! n      "#" o  ������ 0 stringvalue stringValue# o  ������ 80 customizationdescription_4 CustomizationDescription_4��  ��  ��  � $%$ l ����������  ��  ��  % &'& Z  �@()��*( = ��+,+ o  ������ 0 custom5status  , m  ��-- �.. 
 F A L S E) k  �
// 010 O ��232 I  ����4���� 0 setenabled_ setEnabled_4 5��5 m  ����
�� boovfals��  ��  3 o  ������ 0 select5  1 6��6 O �
787 I  	��9���� 0 setenabled_ setEnabled_9 :��: m  ��
�� boovfals��  ��  8 o  � ���� 80 customizationdescription_5 CustomizationDescription_5��  ��  * k  @;; <=< O >?> I  ��@���� 0 setenabled_ setEnabled_@ A��A m  ��
�� boovtrue��  ��  ? o  ���� 0 select5  = BCB O ,DED I  %+��F���� 0 setenabled_ setEnabled_F G��G m  &'��
�� boovtrue��  ��  E o  "���� 80 customizationdescription_5 CustomizationDescription_5C HIH r  -6JKJ I -4��L��
�� .sysoexecTEXT���     TEXTL m  -0MM �NN � d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   C u s t o m i z a t i o n 5��  K o      ���� 0 description5  I O��O r  7@PQP o  78���� 0 description5  Q l     R����R n      STS o  =?���� 0 stringvalue stringValueT o  8=���� 80 customizationdescription_5 CustomizationDescription_5��  ��  ��  ' UVU l AA��������  ��  ��  V W��W l AA��������  ��  ��  ��   � XYX l     ��������  ��  ��  Y Z[Z i   I L\]\ I      ��^��� :0 applicationshouldterminate_ applicationShouldTerminate_^ _�~_ o      �}�} 
0 sender  �~  �  ] k     `` aba l     �|cd�|  c L F Insert code here to do any housekeeping before your application quits   d �ee �   I n s e r t   c o d e   h e r e   t o   d o   a n y   h o u s e k e e p i n g   b e f o r e   y o u r   a p p l i c a t i o n   q u i t sb fgf l     �{�z�y�{  �z  �y  g hih l     �xjk�x  j ; 5# Make sure that the plist is removed at termination.   k �ll j #   M a k e   s u r e   t h a t   t h e   p l i s t   i s   r e m o v e d   a t   t e r m i n a t i o n .i mnm I    �wo�v
�w .sysoexecTEXT���     TEXTo m     pp �qq � i f   [ [   - f   " / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t "   ] ] ;   t h e n   r m   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t ;   f i ;�v  n rsr l   �u�t�s�u  �t  �s  s t�rt L    uu n   
vwv o    	�q�q  0 nsterminatenow NSTerminateNoww m    �p
�p misccura�r  [ xyx l     �o�n�m�o  �n  �m  y z{z l     �l|}�l  | v p# Check for each check box. If there write the values into the the shell script with the trigger from the plist.   } �~~ � #   C h e c k   f o r   e a c h   c h e c k   b o x .   I f   t h e r e   w r i t e   t h e   v a l u e s   i n t o   t h e   t h e   s h e l l   s c r i p t   w i t h   t h e   t r i g g e r   f r o m   t h e   p l i s t .{ � i   M P��� I      �k��j�k 0 
customize_  � ��i� o      �h�h 
0 sender  �i  �j  � k     ��� ��� l     �g�f�e�g  �f  �e  � ��� l     �d���d  � - '# Check for and setup the shell script.   � ��� N #   C h e c k   f o r   a n d   s e t u p   t h e   s h e l l   s c r i p t .� ��� I    �c��b
�c .sysoexecTEXT���     TEXT� m     �� ��� p n a m e = $ ( d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   n a m e ) ;   i f   [ [   !   - f   " / p r i v a t e / t m p / p o l i c y H e l p e r _ $ p n a m e . s h "   ] ] ;   t h e n   t o u c h   / p r i v a t e / t m p / p o l i c y H e l p e r _ $ p n a m e . s h ;   e c h o   " # !   / b i n / b a s h "   >   / p r i v a t e / t m p / p o l i c y H e l p e r _ $ p n a m e . s h ;   e l s e   r m   / p r i v a t e / t m p / p o l i c y H e l p e r _ $ p n a m e . s h ;   t o u c h   / p r i v a t e / t m p / p o l i c y H e l p e r _ $ p n a m e . s h ;   e c h o   " # !   / b i n / b a s h "   >   / p r i v a t e / t m p / p o l i c y H e l p e r _ $ p n a m e . s h ;   f i ;�b  � ��� l   �a�`�_�a  �`  �_  � ��� r    ��� l   ��^�]� n   ��� I    �\�[�Z�\ 	0 state  �[  �Z  � o    �Y�Y 0 select1  �^  �]  � o      �X�X 0 select1value  � ��� Z    )���W�V� =   ��� o    �U�U 0 select1value  � m    �T�T � I    %�S��R
�S .sysoexecTEXT���     TEXT� m     !�� ���� p n a m e = $ ( d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   n a m e ) ;   t r i g g e r 1 = $ ( d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   t r i g g e r 1 ) ;   e c h o   " j a m f   p o l i c y   - t r i g g e r   $ t r i g g e r 1 "   > >   / p r i v a t e / t m p / p o l i c y H e l p e r _ $ p n a m e . s h�R  �W  �V  � ��� l  * *�Q�P�O�Q  �P  �O  � ��� r   * 9��� l  * 3��N�M� n  * 3��� I   / 3�L�K�J�L 	0 state  �K  �J  � o   * /�I�I 0 select2  �N  �M  � o      �H�H 0 select2value  � ��� Z   : M���G�F� =  : A��� o   : ?�E�E 0 select2value  � m   ? @�D�D � I  D I�C��B
�C .sysoexecTEXT���     TEXT� m   D E�� ���� p n a m e = $ ( d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   n a m e ) ;   t r i g g e r 2 = $ ( d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   t r i g g e r 2 ) ;   e c h o   " j a m f   p o l i c y   - t r i g g e r   $ t r i g g e r 2 "   > >   / p r i v a t e / t m p / p o l i c y H e l p e r _ $ p n a m e . s h�B  �G  �F  � ��� l  N N�A�@�?�A  �@  �?  � ��� r   N ]��� l  N W��>�=� n  N W��� I   S W�<�;�:�< 	0 state  �;  �:  � o   N S�9�9 0 select3  �>  �=  � o      �8�8 0 select3value  � ��� Z   ^ q���7�6� =  ^ e��� o   ^ c�5�5 0 select3value  � m   c d�4�4 � I  h m�3��2
�3 .sysoexecTEXT���     TEXT� m   h i�� ���� p n a m e = $ ( d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   n a m e ) ;   t r i g g e r 3 = $ ( d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   t r i g g e r 3 ) ;   e c h o   " j a m f   p o l i c y   - t r i g g e r   $ t r i g g e r 3 "   > >   / p r i v a t e / t m p / p o l i c y H e l p e r _ $ p n a m e . s h�2  �7  �6  � ��� l  r r�1�0�/�1  �0  �/  � ��� r   r ���� l  r {��.�-� n  r {��� I   w {�,�+�*�, 	0 state  �+  �*  � o   r w�)�) 0 select4  �.  �-  � o      �(�( 0 select4value  � ��� Z   � ����'�&� =  � ���� o   � ��%�% 0 select4value  � m   � ��$�$ � I  � ��#��"
�# .sysoexecTEXT���     TEXT� m   � ��� ���� p n a m e = $ ( d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   n a m e ) ;   t r i g g e r 4 = $ ( d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   t r i g g e r 4 ) ;   e c h o   " j a m f   p o l i c y   - t r i g g e r   $ t r i g g e r 4 "   > >   / p r i v a t e / t m p / p o l i c y H e l p e r _ $ p n a m e . s h�"  �'  �&  � ��� l  � ��!� ��!  �   �  � ��� r   � ���� l  � ����� n  � ���� I   � ����� 	0 state  �  �  � o   � ��� 0 select5  �  �  � o      �� 0 select5value  � ��� Z   � ������ =  � ���� o   � ��� 0 select5value  � m   � ��� � I  � ����
� .sysoexecTEXT���     TEXT� m   � ��� ���� p n a m e = $ ( d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   n a m e ) ;   t r i g g e r 5 = $ ( d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   t r i g g e r 5 ) ;   e c h o   " j a m f   p o l i c y   - t r i g g e r   $ t r i g g e r 5 "   > >   / p r i v a t e / t m p / p o l i c y H e l p e r _ $ p n a m e . s h�  �  �  � ��� l  � �����  �  �  � ��� l  � �����  � = 7# Write the auto-delete at the end of the shell script.   � ��� n #   W r i t e   t h e   a u t o - d e l e t e   a t   t h e   e n d   o f   t h e   s h e l l   s c r i p t .� ��� I  � ����
� .sysoexecTEXT���     TEXT� m   � ��� ���> p n a m e = $ ( d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   n a m e ) ;   e c h o   " r m   / p r i v a t e / t m p / p o l i c y H e l p e r _ $ p n a m e . s h "   > >   / p r i v a t e / t m p / p o l i c y H e l p e r _ $ p n a m e . s h�  � ��� l  � ���
�	�  �
  �	  � ��� l  � �����  � + %# Make executable so JAMF can run it.   � ��� J #   M a k e   e x e c u t a b l e   s o   J A M F   c a n   r u n   i t .� � � I  � ���
� .sysoexecTEXT���     TEXT m   � � � � p n a m e = $ ( d e f a u l t s   r e a d   / p r i v a t e / t m p / c o m . s c t c o d i n g . p o l i c y h e l p e r . p l i s t   n a m e ) ;   c h m o d   + x   / p r i v a t e / t m p / p o l i c y H e l p e r _ $ p n a m e . s h�    � I  � ����
� .aevtquitnull��� ��� null�  �  �  �  l     �� ���  �   ��    i   Q T	
	 I      ������ 0 nocustomize_   �� o      ���� 
0 sender  ��  ��  
 k       l     ����   ) ## If don't customize selected quit.    � F #   I f   d o n ' t   c u s t o m i z e   s e l e c t e d   q u i t . �� I    ������
�� .aevtquitnull��� ��� null��  ��  ��   �� l     ��������  ��  ��  ��   " �� l     ��������  ��  ��  ��       ����   ���� 0 appdelegate AppDelegate �� #�� 0 appdelegate AppDelegate  ����
�� misccura
�� 
pcls �  N S O b j e c t ���������������������������������������� !��   ����������������������������������������������
�� 
pare�� 0 windowtitle WindowTitle�� &0 policybasicaction PolicyBasicAction�� 80 customizationdescription_1 CustomizationDescription_1�� 80 customizationdescription_2 CustomizationDescription_2�� 80 customizationdescription_3 CustomizationDescription_3�� 80 customizationdescription_4 CustomizationDescription_4�� 80 customizationdescription_5 CustomizationDescription_5�� 0 select1  �� 0 select2  �� 0 select3  �� 0 select4  �� 0 select5  �� 0 select1value  �� 0 select2value  �� 0 select3value  �� 0 select4value  �� 0 select5value  �� 0 	thewindow 	theWindow�� B0 applicationwillfinishlaunching_ applicationWillFinishLaunching_�� :0 applicationshouldterminate_ applicationShouldTerminate_�� 0 
customize_  �� 0 nocustomize_  ��  
�� 
msng
�� 
msng
�� 
msng
�� 
msng
�� 
msng
�� 
msng
�� 
msng
�� 
msng
�� 
msng
�� 
msng
�� 
msng
�� 
msng
�� 
msng
�� 
msng
�� 
msng
�� 
msng
�� 
msng
�� 
msng �� �����"#���� B0 applicationwillfinishlaunching_ applicationWillFinishLaunching_�� ��$�� $  ���� 0 anotification aNotification��  " ������������������������������ 0 anotification aNotification�� 0 
plistcheck  �� 0 titleofwindow  �� 0 defaultaction  �� 0 custom1status  �� 0 custom2status  �� 0 custom3status  �� 0 custom4status  �� 0 custom5status  �� 0 description1  �� 0 description2  �� 0 description3  �� 0 description4  �� 0 description5  #  ��� ������� 5>GPYi��������-M
�� .sysoexecTEXT���     TEXT
�� .aevtquitnull��� ��� null
�� .miscactvnull��� ��� null�� 0 stringvalue stringValue�� 0 setenabled_ setEnabled_��C�j E�O��  
*j Y hO) *j UO�j E�O�b  �,FO�j E�O�b  �,FO�j E�O�j E�O�j E�O�j E�O�j E�O��  $b   *fk+ UOb   *fk+ UY 3b   *ek+ UOb   *ek+ UO�j E�O�b  �,FO�a   $b  	 *fk+ UOb   *fk+ UY 5b  	 *ek+ UOb   *ek+ UOa j E�O�b  �,FO�a   $b  
 *fk+ UOb   *fk+ UY 5b  
 *ek+ UOb   *ek+ UOa j E�O�b  �,FO�a   $b   *fk+ UOb   *fk+ UY 5b   *ek+ UOb   *ek+ UOa j E�O�b  �,FO�a   $b   *fk+ UOb   *fk+ UY 5b   *ek+ UOb   *ek+ UOa j E�O�b  �,FOP ��]����%&���� :0 applicationshouldterminate_ applicationShouldTerminate_�� ��'�� '  ���� 
0 sender  ��  % ���� 
0 sender  & p������
�� .sysoexecTEXT���     TEXT
�� misccura��  0 nsterminatenow NSTerminateNow�� �j O��,E  �������()���� 0 
customize_  �� ��*�� *  ���� 
0 sender  ��  ( ���� 
0 sender  ) �������������
�� .sysoexecTEXT���     TEXT�� 	0 state  
�� .aevtquitnull��� ��� null�� ��j Ob  j+ Ec  Ob  k  
�j Y hOb  	j+ Ec  Ob  k  
�j Y hOb  
j+ Ec  Ob  k  
�j Y hOb  j+ Ec  Ob  k  
�j Y hOb  j+ Ec  Ob  k  
�j Y hO�j O�j O*j 
! ��
����+,���� 0 nocustomize_  �� ��-�� -  ���� 
0 sender  ��  + ���� 
0 sender  , ��
�� .aevtquitnull��� ��� null�� *j   ascr  ��ޭ