import { UserInputService, ReplicatedStorage } from "@rbxts/services";

//const keyPressEvent = ReplicatedStorage.WaitForChild("KeyPressEvent") as RemoteEvent;

UserInputService.InputBegan.Connect((input, gameProcessed) => {
	if (gameProcessed === true) return;

	if (input.KeyCode === Enum.KeyCode.E) {
		print("pressed by the chairman!");
	}
});
