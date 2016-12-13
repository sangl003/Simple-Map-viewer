using Esri.ArcGISRuntime.Controls;
using Esri.ArcGISRuntime.Layers;
using Esri.ArcGISRuntime.Tasks.Query;
using System;
using System.Windows;
using System.Windows.Controls;
using Esri.ArcGISRuntime.Geometry;
using Esri.ArcGISRuntime.Location;
using System.Threading.Tasks;
using System.Windows.Threading;

namespace Simple_Map_viewer
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            ListBox1.Items.Add("http://sampleserver1.arcgisonline.com/ArcGIS/rest/services/Specialty/ESRI_StateCityHighway_USA/MapServer");
            ListBox1.Items.Add("http://sampleserver1.arcgisonline.com/ArcGIS/rest/services/Specialty/ESRI_StatesCitiesRivers_USA/MapServer");
            ListBox1.Items.Add("http://sampleserver1.arcgisonline.com/ArcGIS/rest/services/Demographics/ESRI_Census_USA/MapServer");
            ListBox1.Items.Add("http://sampleserver1.arcgisonline.com/ArcGIS/rest/services/Demographics/ESRI_Population_World/MapServer");

        }

        private void providerSelector_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {

                MyMapView.LocationDisplay.LocationProvider = new SystemLocationProvider();
            }
            catch (Exception ex)
            {

                MyMapView.LocationDisplay.LocationProvider = null;
                MessageBox.Show(ex.Message, "Unable to share location");
            }
        }
        
        // Identify features at the click point
        private async void MyMapView_MapViewTapped(object sender, MapViewInputEventArgs e)
        {
            try
            {
                progress.Visibility = Visibility.Visible;
                resultsGrid.DataContext = null;

                GraphicsOverlay graphicsOverlay = MyMapView.GraphicsOverlays["graphicsOverlay"];
                graphicsOverlay.Graphics.Clear();
                graphicsOverlay.Graphics.Add(new Graphic(e.Location));

                // Get current viewpoints extent from the MapView
                var currentViewpoint = MyMapView.GetCurrentViewpoint(ViewpointType.BoundingGeometry);
                var viewpointExtent = currentViewpoint.TargetGeometry.Extent;

                IdentifyParameters identifyParams = new IdentifyParameters(e.Location, viewpointExtent, 2, (int)MyMapView.ActualHeight, (int)MyMapView.ActualWidth)
                {
                    LayerOption = LayerOption.Visible,
                    SpatialReference = MyMapView.SpatialReference,
                };
                string URl = Convert.ToString(ListBox1.SelectedItem);
                System.Uri myUri = new System.Uri(URl);

                IdentifyTask identifyTask = new IdentifyTask(myUri);

                var result = await identifyTask.ExecuteAsync(identifyParams);

                resultsGrid.DataContext = result.Results;
                if (result != null && result.Results != null && result.Results.Count > 0)
                    titleComboBox.SelectedIndex = 0;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Identify");
            }
            finally
            {
                progress.Visibility = Visibility.Collapsed;
            }
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            try
            {
                MyMapView.Map.Layers.RemoveAt(1);
                //MyMapView.Map.Layers.Clear();
            }

            catch (System.Exception)
            {
                System.Windows.MessageBox.Show("Unable to clear map");
                return;
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {

            string theArcGISDynamicMapServiceLayerName = null;

            // Create a variable to hold the name of the ServiceUri string.


            try
            {
                // Set the ServiceUri string to the user selected ListBox item.
                theArcGISDynamicMapServiceLayerName = ListBox1.SelectedItem.ToString();
            }
            catch (System.Exception)
            {
                // Notify the user that they must select a ListBox item.
                System.Windows.MessageBox.Show("You must select a ServiceUri string in the listbox before clicking the button.");
                return;
            }

            // Create a new ArcGISDynamicMapServiceLayer.
            Esri.ArcGISRuntime.Layers.ArcGISDynamicMapServiceLayer myArcGISDynamicMapServiceLayer = new Esri.ArcGISRuntime.Layers.ArcGISDynamicMapServiceLayer();

            // Set the ServiceUri property.
            myArcGISDynamicMapServiceLayer.ServiceUri = theArcGISDynamicMapServiceLayerName;

            // Call the InitializeAsync method which will load the metadata for the layer. 
            System.Threading.Tasks.Task myTask = myArcGISDynamicMapServiceLayer.InitializeAsync();

            if (!myTask.IsCompleted)
            {
                // The Task (i.e. the layer loading) has not completed yet, let the user know that.
                // System.Windows.MessageBox.Show("Layer Initializing....");

                try
                {
                    // Now wait for the Task to complete. This will lock the GUI until the Task completes. Notify the user of the result.  
                    // await myTask;
                    // Now add the ArcGISDynamicMapServiceLayer to the Map's LayerCollection
                    Esri.ArcGISRuntime.Layers.LayerCollection theLayerCollection = MyMapView.Map.Layers;
                    theLayerCollection.Add(myArcGISDynamicMapServiceLayer);
                }
                catch (System.Exception ex)
                {
                    // The Task has completed but we have an error. Display to the user that there is something wrong with the layer.
                    Esri.ArcGISRuntime.Http.ArcGISWebException myArcGISWebException = (Esri.ArcGISRuntime.Http.ArcGISWebException)ex;
                    System.Windows.MessageBox.Show(ex.ToString(), "Initialized Failed");
                }
            }
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            if (this.TextBox1.Text != "")
            {
                ListBox1.Items.Add(this.TextBox1.Text);
                this.TextBox1.Focus();
                this.TextBox1.Clear();
                MessageBox.Show("Web service URL added to the list");
            }
        }
    }
}
