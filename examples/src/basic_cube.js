(function() {
  var camera, cube, cube_geometry, cube_material, renderer, scene;
  camera = new THREE.Camera(70, window.innerWidth / window.innerHeight, 1, 1000);
  camera.position.z = 500;
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
  renderer.render(scene, camera);
  this.camera = camera;
  this.renderer = renderer;
}).call(this);
