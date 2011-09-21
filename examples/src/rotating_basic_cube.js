(function() {
  var animate, camera, cube, cube_geometry, cube_material, renderer, scene, tick;
  camera = new THREE.Camera(70, window.innerWidth / window.innerHeight, 1, 1000);
  camera.position.z = 200;
  scene = new THREE.Scene;
  cube_geometry = new THREE.CubeGeometry(100, 100, 100);
  cube_material = new THREE.MeshNormalMaterial;
  cube = new THREE.Mesh(cube_geometry, cube_material);
  scene.addObject(cube);
  cube.rotation.x = 45;
  cube.rotation.y = 45;
  cube.rotation.z = 45;
  renderer = new THREE.WebGLRenderer;
  renderer.setSize(window.innerWidth, window.innerHeight);
  document.body.appendChild(renderer.domElement);
  animate = function() {
    requestAnimationFrame(animate);
    tick();
    return renderer.render(scene, camera);
  };
  tick = function() {
    cube.rotation.x += 0.01;
    cube.rotation.y += 0.01;
    return cube.rotation.z += 0.01;
  };
  animate();
  this.camera = camera;
  this.renderer = renderer;
}).call(this);
