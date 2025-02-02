import { UserInputService, ReplicatedStorage } from "@rbxts/services";

const keyPressEvent = ReplicatedStorage.WaitForChild("KeyPressEvent") as RemoteEvent;

// Function to detect key presses

UserInputService.InputBegan.Connect((input, gameProcessed) => {
	if (gameProcessed) return; // Ignore inputs that are already being handled

	if (input.KeyCode === Enum.KeyCode.E) {
		// Change this key to whatever you want
		print("E key pressed! Sending to server...");
		keyPressEvent.FireServer("E");
	}
});
