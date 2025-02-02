import { Players } from "@rbxts/services";
import { playerstruct } from "types/gameTypes";

export class playerManager {
	private data: Map<Player, playerstruct> = new Map();

	playerJoin(plr: Player) {
		print(`${plr.Name} has joined!`);
		this.data.set(plr, {
			name: plr.Name,
			id: plr.UserId,
			time: 0,
		});
	}
}
