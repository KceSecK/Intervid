<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    SecurityContext ctx = SecurityContextHolder.getContext();
    Authentication auth = ctx.getAuthentication();
    String rol = auth.getAuthorities().toString();

    session.setAttribute("rol", rol);
%>
<html>
    <head>
        <title>InterVid</title>
        <script type='text/javascript' src='https://cdn.scaledrone.com/scaledrone.min.js'></script>
        <jsp:include page="head.jsp" flush="true" />

    </head>
    <body>
        <jsp:include page="postulante/headerpostulante.jsp"/>
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

        <jsp:include page="footer.jsp"/>
        <script src="js/videoLlamada.js" type="text/javascript"></script>
        <script src="js/adapter.js"></script>
        <script type="text/javascript">
            /*
             *  Copyright (c) 2015 The WebRTC project authors. All Rights Reserved.
             *
             *  Use of this source code is governed by a BSD-style license
             *  that can be found in the LICENSE file in the root of the source
             *  tree.
             */

// This code is adapted from
// https://rawgit.com/Miguelao/demos/master/mediarecorder.html

            'use strict';

            /* globals MediaRecorder */

            const mediaSource = new MediaSource();
            mediaSource.addEventListener('sourceopen', handleSourceOpen, false);
            let mediaRecorder;
            let recordedBlobs;
            let sourceBuffer;

            const errorMsgElement = document.querySelector('span#errorMsg');
            const recordedVideo = document.querySelector('video#recorded');
            const recordButton = document.querySelector('button#record');
            recordButton.addEventListener('click', () => {
                if (recordButton.textContent === 'Start Recording') {
                    startRecording();
                } else {
                    stopRecording();
                    recordButton.textContent = 'Start Recording';
                    playButton.disabled = false;
                    downloadButton.disabled = false;
                }
            });

            const playButton = document.querySelector('button#play');
            playButton.addEventListener('click', () => {
                const superBuffer = new Blob(recordedBlobs, {type: 'video/webm'});
                recordedVideo.src = null;
                recordedVideo.srcObject = null;
                recordedVideo.src = window.URL.createObjectURL(superBuffer);
                recordedVideo.controls = true;
                recordedVideo.play();
            });

            const downloadButton = document.querySelector('button#download');
            downloadButton.addEventListener('click', () => {
                const blob = new Blob(recordedBlobs, {type: 'video/webm'});
                const url = window.URL.createObjectURL(blob);
                const a = document.createElement('a');
                a.style.display = 'none';
                a.href = url;
                a.download = 'test.webm';
                document.body.appendChild(a);
                a.click();
                setTimeout(() => {
                    document.body.removeChild(a);
                    window.URL.revokeObjectURL(url);
                }, 100);
            });

            function handleSourceOpen(event) {
                console.log('MediaSource opened');
                sourceBuffer = mediaSource.addSourceBuffer('video/webm; codecs="vp8"');
                console.log('Source buffer: ', sourceBuffer);
            }

            function handleDataAvailable(event) {
                if (event.data && event.data.size > 0) {
                    recordedBlobs.push(event.data);
                }
            }

            function startRecording() {
                recordedBlobs = [];
                let options = {mimeType: 'video/webm;codecs=vp9'};
                if (!MediaRecorder.isTypeSupported(options.mimeType)) {
                    console.error(`${options.mimeType} is not Supported`);
                    errorMsgElement.innerHTML = `${options.mimeType} is not Supported`;
                    options = {mimeType: 'video/webm;codecs=vp8'};
                    if (!MediaRecorder.isTypeSupported(options.mimeType)) {
                        console.error(`${options.mimeType} is not Supported`);
                        errorMsgElement.innerHTML = `${options.mimeType} is not Supported`;
                        options = {mimeType: 'video/webm'};
                        if (!MediaRecorder.isTypeSupported(options.mimeType)) {
                            console.error(`${options.mimeType} is not Supported`);
                            errorMsgElement.innerHTML = `${options.mimeType} is not Supported`;
                            options = {mimeType: ''};
                        }
                    }
                }

                try {
                    mediaRecorder = new MediaRecorder(window.stream, options);
                } catch (e) {
                    console.error('Exception while creating MediaRecorder:', e);
                    errorMsgElement.innerHTML = `Exception while creating MediaRecorder: ${JSON.stringify(e)}`;
                    return;
                }

                console.log('Created MediaRecorder', mediaRecorder, 'with options', options);
                recordButton.textContent = 'Stop Recording';
                playButton.disabled = true;
                downloadButton.disabled = true;
                mediaRecorder.onstop = (event) => {
                    console.log('Recorder stopped: ', event);
                };
                mediaRecorder.ondataavailable = handleDataAvailable;
                mediaRecorder.start(10); // collect 10ms of data
                console.log('MediaRecorder started', mediaRecorder);
            }

            function stopRecording() {
                mediaRecorder.stop();
                console.log('Recorded Blobs: ', recordedBlobs);
            }

            function handleSuccess(stream) {
                recordButton.disabled = false;
                console.log('getUserMedia() got stream:', stream);
                window.stream = stream;

                const gumVideo = document.querySelector('video#gum');
                gumVideo.srcObject = stream;
            }

            async function init(constraints) {
                try {
                    const stream = await navigator.mediaDevices.getUserMedia(constraints);
                    handleSuccess(stream);
                } catch (e) {
                    console.error('navigator.getUserMedia error:', e);
                    errorMsgElement.innerHTML = `navigator.getUserMedia error:${e.toString()}`;
                }
            }

            document.querySelector('button#start').addEventListener('click', async () => {
                const hasEchoCancellation = document.querySelector('#echoCancellation').checked;
                const constraints = {
                    audio: {
                        echoCancellation: {exact: hasEchoCancellation}
                    },
                    video: {
                        width: 1280, height: 720
                    }
                };
                console.log('Using media constraints:', constraints);
                await init(constraints);
            });
        </script>
    </body>
</html>
