   M S B A M L   `   `   `  ����  Simple Map viewer"    Simple_Map_viewer.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   Z VEsri.ArcGISRuntime, Version=10.2.7.0, Culture=neutral, PublicKeyToken=8fc3cc631e44ad866esri+http://schemas.esri.com/arcgis/runtime/2013  5   	     � Title$  Simple Desktop Map Viewer��5      .��5      � -   5         �Name$ 
layoutGrid��5       � 	Resources 5   
   5  /Esri.ArcGISRuntime.Symbology.SimpleMarkerSymbol   MarkerSymbol   Size   Color   Style1  +Esri.ArcGISRuntime.Symbology.SimpleRenderer  MarkerRenderer   Symbol��%m   &	        &	 =     7     5	      $ 12Q�6;   $	 Red��6E   $ Circle=�6Q     5
      8   69   5      .+�5   
   )  #Esri.ArcGISRuntime.Controls.MapView  -   5          Name$ 	MyMapView��5         
WrapAround . $��0,0,-0.4,-0.4q�6d   
	   Map.	 5      %  Esri.ArcGISRuntime.Controls.Map  
   InitialViewpoint4  .Esri.ArcGISRuntime.Controls.ViewpointConverter$+
 %-15000000, 2000000, -7000000, 8000000 6      Layers. 5      :  4Esri.ArcGISRuntime.Layers.ArcGISTiledMapServiceLayer  %  Esri.ArcGISRuntime.Layers.Layer   DisplayName$ Basemap��62      
ServiceUri$S Mhttp://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer��5   	   5      *  $Esri.ArcGISRuntime.Controls.ViewBase   GraphicsOverlays 5      1	  +Esri.ArcGISRuntime.Controls.GraphicsOverlay	  	 	  ID$ graphicsOverlay��6'    	  Renderer# [ 6<   5      �� 5   
   ���	#FFEFE8E8$��1q�6)   $��0,10,10.2,0q�5       �� Padding$ 20q�6   $	��325��6'   $��Right=�5      $	��Top=�6-   $	��451��6E    �� CornerRadius$ 1��6R    J� Opacity$	 0.8Q�6c   ��5      �� 5       �� EndPoint$ 0.5,1&�6&    � MappingMode$ RelativeToBoundingBox=�67    �� 
StartPoint$ 0.5,0&�6[   .��5      �  � Color$ Black��6#    � Offset$ 1Q�61   � 5      $ 	#FFC1CDDB��6#   � 5       $ 	#FF4839DE��6#   $ 0.446Q�65   � 5!      $ 	#FF582B67��6#   $ 0.605Q�65   � 5"      $ 	#FF5668AE��6#   $ 0.245Q�65   � 5#      $ 	#FF210C28��6#   $ 0.854Q�65   � 5$      $ 	#FF5C6EB0��6#   $ 0.245Q�65   5%      ._�5'      � -   5        $ resultsGrid��5'       � RowDefinitions 5(      �� 5)      $
��Auto �6$   �� 5*      $
��Auto �6$   �� 5+      $
��Auto �6$   �� 5,      $��* �6$   .+�5.      �� $��Location��6   $��0,0,10.2,4.8q�6z   $��16��6�   
�������$
��Bold"�6�   $��Segoe UI Emoji)�6�   $��Right=�6�   $	��273��6�    d� 	IsChecked 6.   ��  �� ElementName$ 	MyMapView�� �� Path$ LocationDisplay.IsEnabled�6�   �� 5/      -   5         ��Name$ TextBox1��5/       �� TextWrapping$
 Wrap=�6,   $��Enter New URL��6@   $��0,0.2,0.2,365.6q�6W   $��3��6p    �� SelectionBrush �	#FF7BE8EB.��6�     J� Effect  50      3
  -System.Windows.Media.Effects.DropShadowEffect
  51      .��52   &   53      �� 54      -   5        $%��Add Layer from Web to the List ��54      $��23��6Z   $��0,28.2,0.2,0q�6f   $	��Top=�6|   $��3��6�   $
��Bold"�6�     55      
  56      58      �� 59      -   5        ! ��Name$! ListBox1��59      $��0,74.2,0.2,226.6q�6,   $��3��6F     5:      
  5;      5=      �� 5>      -   5        $��Clear Layer��5>      $��185,167.2,0.2,193.6q�6F   $��3��6c   $
��Bold"�6p   ���	#FFE7E7E7  5?      
  5@      5B      �� 5C      -   5        " ��Name$" Button2��5C      $��	Add Layer��6*   $��0,167.2,191.2,193.6q�6U   $��3��6r   $
��Bold"�6   $��1q�6�   $��Center=�6�   # � UseLayoutRounding# .  ���	#FFDDDDDD  5D      
  5E      5G      �� 5H      $5��/Click in the United States to identify features��6   $��0,213.2,0.2,153.6q�6S   $��3��6n   $
��Bold"�6{   $��Segoe UI Emoji)�6�   ���	#FFFEFEFE6�   �� 5J      -	   5        $ ��Name$$ titleComboBox��5J      $��3��62   $% �� IsSynchronizedWithCurrentItem$
% TrueY�6W   $��0,240.2,0.2,120.6q�6|   ��6?   ��   5K      
  5L      ��5N      �� 5O      .R�5P      �� ��5Q   "   `� 5R   &   & �� StringFormat$& 	{0} ({1})��63   .1�5S   *   �� $ Value�62   �� 5T   *   $ 	LayerName�62   5U   '   5W      5X      5Z      � 5\      -
   5        ' �Name$' progress��5\   +   $��2��6   ( � IsIndeterminate( . $��10q�6T   $y�	Collapsed=�6`   �� 5^      $��3��6   $��0,273.2,0.2,-0.4q�6(   $
% TrueY�6B   ��5_      �� $ titleComboBox��$% SelectedItem.Feature.Attributes�  5`      
  5a      ��5c      �� 5d      .R�5e      �� ) �� Orientation$) 
Horizontal=�6)   .+�5f   "   �� $	��100��6F   ��6,   �� $	 Key�6F   �� 5g   "   ��6,   �� $ Value�5h      5i      5k      5l      5m      5o      5p      