export interface playerstruct {
	name: string;
	id: number;
	time: number;
}

export interface Character extends Model {
	HumanoidRootPart: BasePart;
	Humanoid: Humanoid;
}
