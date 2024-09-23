# 360 Scene Shader System

This shader system allows you to create mask objects in a 360 scene that reveal the skybox while hiding other scene objects. It consists of two main components: a mask shader and an object shader that preserves original material properties.

## Setup

1. Ensure you have the following shaders in your project:
   - `FullObjectMask`
   - `ObjectPreserving`

2. Make sure your project is using the Universal Render Pipeline (URP).

## Using the Mask Shader

1. Create a new material for your mask object:
   - In the Project window, right-click and select Create > Material.
   - Name it something like "MaskMaterial".
   - Example is added in the package. 

2. Assign the mask shader to the material:
   - Select the new material.
   - In the Inspector, click on the Shader dropdown.
   - Choose Custom > FullObjectMask.

3. Apply the mask material to your mask objects:
   - Select the mask object in the Hierarchy.
   - Drag the mask material onto the object or into its Material slot in the Inspector.
   - Prefab is added in the package. 

4. Position your mask objects where you want the skybox to be visible.

## Using the Preserving Object Shader

For each object that should be hidden behind the mask:

1. Select the object in the Hierarchy.

2. In the Inspector, find the Material component.
   - Change the Shader to Custom > ObjectPreserving.

## Troubleshooting

- If objects aren't being masked correctly, ensure that:
  - The mask objects and scene objects are on the correct render layers.
  - The stencil reference values in both shaders match (default is 1).

- If the skybox isn't visible through the mask:
  - Check that your skybox is set up correctly in the scene settings.
  - Verify that the mask objects are positioned correctly.

- If objects lose their original appearance:
  - You can create a material variant before changing the shader.
  - Verify that all relevant texture and color properties are set correctly in the new material.

## Advanced Usage

- To change the render order, modify the "Queue" tag in the shader code.
- For materials with additional properties (e.g., normal maps), you may need to extend the ObjectPreserving shader.
