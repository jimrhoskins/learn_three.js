# rotating_basic_cube
#
# This example is an extension of the {{basic_cube}} example.
#
# In this example, the scene is the same, however the cube now
# rotates on all three axes.
#
# The animation is achieved using requestAnimationFrame 
# (http://paulirish.com/2011/requestanimationframe-for-smart-animating/)
#
# The requestAnimationFrame implementaiont is provided by js/RequestAnimationFrame.js
#
# In each tick of the animation, a small amount of rotation is added
# since the updating of the rotation only occurs when the frame is rendered
# and since the the frame is only rendered when the page is visible, the 
# animation will not run when the page is not visible, but pick up where it left
# off when you view the page again. This is because our animation update doesn't
# take into account the actual time elapsing, only the fact a new frame is being 
# rendered

# Create the Camera for the app
camera = new THREE.Camera(
  70                                     # Field of View
  window.innerWidth / window.innerHeight # Aspect Ratio
  1                                      # Near render limit
  1000                                   # Far render limit
)

# Move camera back (z positive is out of the screen, toward you)
camera.position.z = 200


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


# Animate the scene
animate = ->
	requestAnimationFrame animate
	
	# Run the tick function to update scene
	tick()

	# Render the scene, using the camera
	renderer.render scene, camera


tick = ->
	cube.rotation.x+= 0.01
	cube.rotation.y+= 0.01
	cube.rotation.z+= 0.01


# Begine the animation
animate()

# Export from Coffeescript for debuging
@camera = camera
@renderer = renderer


