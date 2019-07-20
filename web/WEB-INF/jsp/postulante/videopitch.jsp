<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>InterVid</title>
        <script type='text/javascript' src='https://cdn.scaledrone.com/scaledrone.min.js'></script>
        <jsp:include page="../head.jsp" flush="true" />
    </head>
    <%
        SecurityContext ctx = SecurityContextHolder.getContext();
        Authentication auth = ctx.getAuthentication();
        String rol = auth.getAuthorities().toString();
    %>

    <body>
        <!-- Navbar-->
        <jsp:include page="headerpostulante.jsp"/>
        <div class="container-fluid div-principal">
            <div class="row">
                <div class="col-lg-12 mb-5">
                    <div class="container">
                        <div class="">
                            <h1 class="text-intervid">Graba tu video pitch</h1>
                        </div>
                        <div class="bg-black mb-3">
                            <video id="vidPitch" controls autoplay playsinline></video>
                        </div>
                        <div class="mb-3">
                            <button class="btn btn-primary" id="btn-start-recording">Iniciar</button>
                            <button class="btn btn-danger" id="btn-stop-recording" disabled>Parar</button>
                            <button class="btn btn-success" id="btn-save-recording" >Guardar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <input type="text" name="room" id="room" />



        <c:choose>
            <c:when test="${sessionScope.rol == '[Postulante]'}">

                <div class="container mt-4">
                    <h1>postulante</h1>
                    ${sessionScope.rol}
                    <div class="container-fluid">

                        <div class="row mb-2 pt-2">
                            <div class="card col-lg-12">
                                <h3 class="text-intervid">Programador</h3>

                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col-lg-3">
                                <div class="row">
                                    <div class="card col-lg-12 mb-2 pt-2">
                                        <h5 class="text-intervid">Duración</h5>
                                        <h5 class="text-intervid">Tiempo</h5>
                                        <button class="btn btn-primary mb-2">Iniciar Entrevista</button>
                                        <button id="record">Start Recording</button>
                                        <button id="play">Play</button>
                                    </div>
                                    <div class="card col-lg-12 pt-2 d-block">
                                        <!--<video id="localVideo" autoplay playsinline></video>-->
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 d-block">
                                <div class="card pt-2">
                                    <video id="recorded" playsinline="" loop="" src="blob:https://webrtc.github.io/02315e47-b314-4704-9770-dc4d8d9b378a" controls=""></video>
                                    <!--<video id="remoteVideo" autoplay playsinline></video>-->
                                </div>
                            </div>
                            <div class="card col-lg-3 pt-2">
                                <h5 class="text-intervid">Instrucciones</h5>
                                asdfasdfasdfasdfasdf
                            </div>
                        </div>
                    </div>

                </div>

                <div id="container">

                    <h1><a href="//webrtc.github.io/samples/" title="WebRTC samples homepage">WebRTC samples</a>
                        <span>MediaRecorder</span></h1>

                    <p>For more information see the MediaStream Recording API <a
                            href="http://w3c.github.io/mediacapture-record/MediaRecorder.html"
                            title="W3C MediaStream Recording API Editor's Draft">Editor's&nbsp;Draft</a>.</p>

                    <video id="gum" playsinline autoplay muted></video>
                    <video id="recorded" playsinline loop></video>

                    <div>
                        <button id="start">Start camera</button>
                        <button id="record" disabled>Start Recording</button>
                        <button id="play" disabled>Play</button>
                        <button id="download" disabled>Download</button>
                    </div>

                    <div>
                        <h4>Media Stream Constraints options</h4>
                        <p>Echo cancellation: <input type="checkbox" id="echoCancellation"></p>
                    </div>

                    <div>
                        <span id="errorMsg"></span>
                    </div>

                    <a href="https://github.com/webrtc/samples/tree/gh-pages/src/content/getusermedia/record"
                       title="View source for this page on GitHub" id="viewSource">View source on GitHub</a>

                </div>

                <!-- include adapter for srcObject shim -->
                <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
                <script src="js/main.js" async></script>
                <script src="../../../js/lib/ga.js"></script>











            </c:when>
            <c:when test="${sessionScope.rol == '[Empresa]'}">
                <h1>empresa</h1>
                ${sessionScope.rol}
            </c:when>
            <c:otherwise>
                <h1>otro</h1>
            </c:otherwise>
        </c:choose>

        <jsp:include page="../footer.jsp" />
    </body>
</html>

<script src="js/RecordRTC.js" type="text/javascript"></script>
<script src="js/adapter.js"></script>
<script>


    // Store a reference of the preview video element and a global reference to the recorder instance
    var video = document.getElementById('vidPitch');
    var recorder;
    var mimeType = 'video/webm';
    var fileExtension = 'webm';
    var type = 'video';



    // When the user clicks on start video recording
    document.getElementById('btn-start-recording').addEventListener("click", function () {
        // Disable start recording button
        this.disabled = true;

        // Request access to the media devices
        navigator.mediaDevices.getUserMedia({
            audio: true,
            video: true
        }).then(function (stream) {
            // Display a live preview on the video element of the page
            setSrcObject(stream, video);

            // Start to display the preview on the video element
            // and mute the video to disable the echo issue !
            video.play();
            video.muted = true;

            // Initialize the recorder
            recorder = new RecordRTCPromisesHandler(stream, {
                type: 'video',
                mimeType: 'video/webm',
                fileExtension: 'webm',
                video: video,
                disableLogs: false,

            });

            // Start recording the video
            recorder.startRecording().then(function () {
                console.info('Recording video ...');
            }).catch(function (error) {
                console.error('Cannot start video recording: ', error);
            });

            // release stream on stopRecording
            recorder.stream = stream;

            // Enable stop recording button
            document.getElementById('btn-stop-recording').disabled = false;
        }).catch(function (error) {
            console.error("Cannot access media devices: ", error);
        });
    }, false);

    // When the user clicks on Stop video recording
    document.getElementById('btn-stop-recording').addEventListener("click", function () {
        this.disabled = true;

        recorder.stopRecording().then(function () {
            console.info('stopRecording success');

            // Retrieve recorded video as blob and display in the preview element

            //            video.src = recorder.getBlob();
            //            video.play();
            //
            //            // Unmute video on preview
            //            video.muted = false;
            // Stop the device streaming
            recorder.stream.stop();
            // to fix video seeking issues

            // Enable record button again !
            document.getElementById('btn-start-recording').disabled = false;

        }).catch(function (error) {
            console.error('stopRecording failure', error);
        });
    }, false);

    function getFileName(fileExtension) {
        var d = new Date();
        var year = d.getUTCFullYear();
        var month = d.getUTCMonth();
        var date = d.getUTCDate();
        return 'Intervid-' + year + month + date + '-' + getRandomString() + '.' + fileExtension;
    }

    function getRandomString() {
        if (window.crypto && window.crypto.getRandomValues && navigator.userAgent.indexOf('Intervid') === -1) {
            var a = window.crypto.getRandomValues(new Uint32Array(3)),
                    token = '';
            for (var i = 0, l = a.length; i < l; i++) {
                token += a[i].toString(36);
            }
            return token;
        } else {
            return (Math.random() * new Date().getTime()).toString(36).replace(/\./g, '');
        }
    }


    document.querySelector('#btn-save-recording').onclick = function () {
        var fileName = getFileName(fileExtension);
        if (!recorder)
            return alert('No recording found.');

        var file = new File([recorder.getBlob()], fileName, {
            type: mimeType

        });

        invokeSaveAsDialog(file, file.name);
    };


</script>

