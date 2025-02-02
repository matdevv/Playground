import { UserInputService, ReplicatedStorage } from "@rbxts/services";

//const keyPressEvent = ReplicatedStorage.WaitForChild("KeyPressEvent") as RemoteEvent;

UserInputService.InputBegan.Connect((input, gameProcessed) => {
	if (gameProcessed) return;

	if (input.KeyCode === Enum.KeyCode.E) {
		print("input test");
	}
});
