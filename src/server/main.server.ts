import { Players, Workspace } from "@rbxts/services";
import { makeHello } from "shared/module";
import { playerManager, board } from "handlers/gameHandler";
import { Character } from "types/gameTypes";

const manager = new playerManager();
const chessBoard = new board();

Players.PlayerAdded.Connect((plr) => {
	manager.playerJoin(plr);

	plr.CharacterAdded.Connect((char) => {
		const copy = char.Clone() as Character;

		copy.Parent = game.Workspace;

		copy.HumanoidRootPart.Anchored = true;
		copy.HumanoidRootPart.Position = new Vector3(0, 5, 0);
	});
});

chessBoard.createBoard();

// print(makeHello("hey bro!"));
