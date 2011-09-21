# basic_cube
#
# This is pretty much a "hello world" app for Three.js
# It consists of a fullscreen render, using WebGL
#
# The Scene contains a single cube, and its material is a prebuilt
# material where the color is determined by the angle of the 
# face relative to the camera (the direction of the Normal)
# http://en.wikipedia.org/wiki/Surface_normal
#
# The cube is rotated by 45 degrees on each axis, to expose 3 faces

# Create the Camera for the app
camera = new THREE.Camera(
  70                                     # Field of View
  window.innerWidth / window.innerHeight # Aspect Ratio
  1                                      # Near render limit
  1000                                   # Far render limit
)

# Move camera back (z positive is out of the screen, toward you)
camera.position.z = 500


# Create the Scene for the application. All objects will be part
# of this scene instance
scene = new THREE.Scene

# The geometry of the Cube, using the built in CubeGemotery primative
cube_geometry = new THREE.CubeGeometry(
  100 # Width
  100 # Height
  100 # Depth
)

# A Material to go over the geometry, shade colors based on Normal
cube_material = new THREE.MeshNormalMaterial

# The cube mesh, combining the geometry and material
cube = new THREE.Mesh(
  cube_geometry
  cube_material
)

# Add the cube to the scene
scene.addObject cube


# Rotate the cube
cube.rotation.x = 45
cube.rotation.y = 45
cube.rotation.z = 45

# Create a renderer, using WebGL
renderer = new THREE.WebGLRenderer

# Set the renderer to the size of the page
renderer.setSize(
  window.innerWidth  # Width
  window.innerHeight # Height
)

# Add renderer to page using its domElement (<canvas>)
document.body.appendChild renderer.domElement


renderer.render scene, camera

# Export from Coffeescript
@camera = camera
@renderer = renderer

