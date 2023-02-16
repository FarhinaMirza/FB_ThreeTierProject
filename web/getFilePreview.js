window.URL = window.URL || window.webkitURL;
useBlob = false && window.URL; // Set to `true` to use Blob instead of Data-URL

// 2.
function readImage(file, elPreview, width, height, hid) {

    var hid1 = document.getElementById(hid);
    // Create a new FileReader instance
    // https://developer.mozilla.org/en/docs/Web/API/FileReader
    var reader = new FileReader();

    // Once a file is successfully readed:
    reader.addEventListener("load", function () {

        // At this point `reader.result` contains already the Base64 Data-URL
        // and we've could immediately show an image using
        // `elPreview.insertAdjacentHTML("beforeend", "<img src='"+ reader.result +"'>");`
        // But we want to get that image's width and height px values!
        // Since the File Object does not hold the size of an image
        // we need to create a new image and assign it's src, so when
        // the image is loaded we can calculate it's width and height:
        var image = new Image();
        image.addEventListener("load", function () {

            // Concatenate our HTML image info 
           // var imageInfo = "<br> Name - " + file.name + ' <br>Size - ' + // get the value of `name` from the `file` Obj
                    //    image.width + '×' + // But get the width from our `image`
                    //   image.height + ' ' +
                    //  file.type + ' ' +
                   // Math.round(file.size / 1024) + 'KB';

            // Finally append our created image and the HTML info string to our `#preview` 
            elPreview.innerHTML = "";
            elPreview.appendChild(this);
            elPreview.insertAdjacentHTML("beforeend", imageInfo + '<br>');

            // If we set the variable `useBlob` to true:
            // (Data-URLs can end up being really large
            // `src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAA...........etc`
            // Blobs are usually faster and the image src will hold a shorter blob name
            // src="blob:http%3A//example.com/2a303acf-c34c-4d0a-85d4-2136eef7d723"
            if (useBlob) {
                // Free some memory for optimal performance
                window.URL.revokeObjectURL(image.src);
            }
        });
        hid1.value = useBlob ? window.URL.createObjectURL(file) : reader.result;
        image.src = useBlob ? window.URL.createObjectURL(file) : reader.result;
        image.style.width = width + "px";
        image.style.height = height + "px";

    });

    // https://developer.mozilla.org/en-US/docs/Web/API/FileReader/readAsDataURL
    reader.readAsDataURL(file);
}




function FillImage(FileUpload,ViewImage, HidVal) {
var fuProductImgBrowse = document.getElementById(FileUpload);
    elPreview = document.getElementById(ViewImage);
    // Let's store the FileList Array into a variable:
    // https://developer.mozilla.org/en-US/docs/Web/API/FileList
    var files = fuProductImgBrowse.files;
    // Let's create an empty `errors` String to collect eventual errors into:
    var errors = "";

    if (!files) {
        errors += "File upload not supported by your browser.";
    }

    // Check for `files` (FileList) support and if contains at least one file:
    if (files && files[0]) {

        // Iterate over every File object in the FileList array
        for (var i = 0; i < files.length; i++) {

            var file = files[i];

            if ((/\.(png|jpeg|jpg|gif)$/i).test(file.name)) {
                readImage(file, elPreview, 254, 254, HidVal);
            } else {
                errors += file.name + " Unsupported Image extension\n";
            }
        }
    }
    if (errors) {
        alert(errors);
    }

}
